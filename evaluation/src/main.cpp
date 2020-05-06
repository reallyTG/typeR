#include "TypeSize.hpp"

#include <fstream>
#include <iostream>
#include <string>
#include <tastr/ast/ast.hpp>
#include <tastr/parser/parser.hpp>

using type_map_t = std::unordered_map<std::string, int>;

std::string quote_and_escape(const std::string& input) {
    std::string output;
    char double_quote = '\"';

    output.reserve(input.size());

    output.push_back(double_quote);

    int input_size = input.size();
    int index = 0;

    for (; index < input_size && input[index] == ' '; ++index)
        ;

    for (; index < input_size; ++index) {
        char ch = input[index];
        if (ch == double_quote) {
            output.push_back(double_quote);
        }
        output.push_back(ch);
    }

    output.push_back(double_quote);

    return output;
}

void write_csv(std::ofstream& of,
               const std::string& package_name,
               const std::string& function_name,
               int parameter_position,
               int outer_alternative,
               int inner_alternative,
               const type_map_t& type_map) {
    for (auto iter = type_map.begin(); iter != type_map.end(); ++iter) {
        of << quote_and_escape(package_name) << ", "  //
           << quote_and_escape(function_name) << ", " //
           << parameter_position << ", "              //
           << outer_alternative << ", "               //
           << inner_alternative << ", "               //
           << quote_and_escape(iter->first) << ", "   //
           << iter->second << std::endl;
    }
}

void analyze_argument_type(std::ofstream& of,
                           const std::string& package_name,
                           const std::string& function_name,
                           const tastr::ast::Node& node,
                           int parameter_position,
                           int outer_alternative,
                           int& inner_alternative) {
    /* argument type has multiple alternatives */
    if (node.is_union_type_node()) {
        const tastr::ast::UnionTypeNode& union_node =
            tastr::ast::as<tastr::ast::UnionTypeNode>(node);

        const tastr::ast::Node& first_node = union_node.get_first_type();
        analyze_argument_type(of,
                              package_name,
                              function_name,
                              first_node,
                              parameter_position,
                              outer_alternative,
                              inner_alternative);

        const tastr::ast::Node& second_node = union_node.get_second_type();
        analyze_argument_type(of,
                              package_name,
                              function_name,
                              second_node,
                              parameter_position,
                              outer_alternative,
                              inner_alternative);
    }
    /* leaf node type of the argument type alternative  */
    else {
        TypeSize type_size;
        type_map_t type_map = std::move(type_size(node));
        write_csv(of,
                  package_name,
                  function_name,
                  parameter_position,
                  outer_alternative,
                  inner_alternative,
                  type_map);
        ++inner_alternative;
    }
}

void analyze_function_type(std::ofstream& of,
                           const std::string& package_name,
                           const std::string& function_name,
                           const tastr::ast::FunctionTypeNode& function_node,
                           int outer_alternative) {
    int inner_alternative = 0;
    analyze_argument_type(of,
                          package_name,
                          function_name,
                          function_node.get_return_type(),
                          -1,
                          outer_alternative,
                          inner_alternative);

    const tastr::ast::Node& node = function_node.get_parameter();

    /* this can only happen if function type is any => any but we don't generate
     * this type for top-level functions  */
    if (!node.is_parameter_node()) {
        fprintf(
            stderr,
            "Error: %s::%s has a function type '%s' with non-parameter node\n",
            package_name.c_str(),
            function_name.c_str(),
            tastr::parser::to_string(function_node).c_str());
        exit(1);
    }

    const tastr::ast::ParameterNode& parameter_node =
        tastr::ast::as<tastr::ast::ParameterNode>(node);

    for (int i = 0; i < parameter_node.get_parameter_count(); ++i) {
        int inner_alternative = 0;
        analyze_argument_type(of,
                              package_name,
                              function_name,
                              parameter_node.at(i),
                              i,
                              outer_alternative,
                              inner_alternative);
    }
}

void analyze_type(std::ofstream& of,
                  const std::string& package_name,
                  const std::string& function_name,
                  const tastr::ast::TypeNode& node,
                  int& outer_alternative) {
    /*  function type has multiple alternatives */
    if (node.is_union_type_node()) {
        const tastr::ast::UnionTypeNode& union_node =
            tastr::ast::as<tastr::ast::UnionTypeNode>(node);

        /* recursively analyze left alternative */
        const tastr::ast::TypeNode& first_node = union_node.get_first_type();
        analyze_type(
            of, package_name, function_name, first_node, outer_alternative);

        /* recursively analyze right alternative */
        const tastr::ast::TypeNode& second_node = union_node.get_second_type();
        analyze_type(
            of, package_name, function_name, second_node, outer_alternative);

    }
    /* final function type at the leaf of alternatives  */
    else if (node.is_function_type_node()) {
        analyze_function_type(
            of,
            package_name,
            function_name,
            tastr::ast::as<tastr::ast::FunctionTypeNode>(node),
            outer_alternative);
        ++outer_alternative;
    }
    /* any other case means that we have encountered a non-function type which
       should not happen  */
    else {
        fprintf(stderr,
                "Error: %s::%s has non function type '%s'\n",
                package_name.c_str(),
                function_name.c_str(),
                tastr::parser::to_string(node).c_str());
        exit(1);
    }
}

int main(int argc, char* argv[]) {
    if (argc < 2) {
        fprintf(stderr,
                "Error: expected two command-line arguments: <type-filepath> "
                "and <output-director>\n");
        exit(1);
    }

    std::string type_filepath = argv[1];
    std::string csv_filepath = argv[2];

    std::ofstream of(csv_filepath);

    of << "package_name, "
       << "function_name, "
       << "parameter_position, "
       << "outer_alternative, "
       << "inner_alternative, "
       << "type, "
       << "count" << std::endl;

    tastr::parser::ParseResult parse_result =
        tastr::parser::parse_file(type_filepath, false, false);

    if (!parse_result) {
        fprintf(stderr,
                "Error: %s in '%s' at location %s\n",
                parse_result.get_error_message().c_str(),
                type_filepath.c_str(),
                to_string(parse_result.get_error_location()).c_str());

        exit(1);
    }

    int position = type_filepath.rfind("/");
    std::string package_name(type_filepath.c_str() + position + 1);

    const tastr::ast::TopLevelNode& top_level_node =
        *parse_result.get_top_level_node().get();

    int size = top_level_node.size();

    for (int i = 0; i < size; ++i) {
        const tastr::ast::TypeDeclarationNode& node = top_level_node.at(i);
        const std::string& function_name = node.get_identifier().get_name();
        int outer_alternative = 0;
        analyze_type(of,
                     package_name,
                     function_name,
                     node.get_type(),
                     outer_alternative);
    }
}
