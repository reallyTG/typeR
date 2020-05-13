#include <string>
#include <tastr/parser/parser.hpp>
#include <tastr/visitor/visitor.hpp>
#include <unordered_map>

class TypeSize final: public tastr::visitor::ConstNodeVisitor {
  public:
    TypeSize(): ConstNodeVisitor(), size_(0) {
    }

    std::unordered_map<std::string, int>
    operator()(const tastr::ast::Node& node) {
        counter_.clear();

        node.accept(*this);

        return counter_;
    }

    virtual void visit(const tastr::ast::NAScalarTypeNode& node) {
        /* one for ^  */
        ++size_;
        /* other for base type  */
        ++size_;
        update_counter_(node);
    }

    virtual void visit(const tastr::ast::CharacterAScalarTypeNode& node) {
        ++size_;
        update_counter_(node);
    }

    virtual void visit(const tastr::ast::ComplexAScalarTypeNode& node) {
        ++size_;
        update_counter_(node);
    }

    virtual void visit(const tastr::ast::DoubleAScalarTypeNode& node) {
        ++size_;
        update_counter_(node);
    }

    virtual void visit(const tastr::ast::IntegerAScalarTypeNode& node) {
        ++size_;
        update_counter_(node);
    }

    virtual void visit(const tastr::ast::LogicalAScalarTypeNode& node) {
        ++size_;
        update_counter_(node);
    }

    virtual void visit(const tastr::ast::RawAScalarTypeNode& node) {
        ++size_;
        update_counter_(node);
    }

    virtual void visit(const tastr::ast::VectorTypeNode& node) {
        /* 1 ([]) + 1 (base type) + optional 1 for ^ */
        size_ += 2 + node.get_scalar_type().is_na_scalar_type_node();
        update_counter_(node);
    }

    virtual void visit(const tastr::ast::EnvironmentTypeNode& node) {
        ++size_;
        update_counter_(node);
    }

    virtual void visit(const tastr::ast::ExpressionTypeNode& node) {
        ++size_;
        update_counter_(node);
    }

    virtual void visit(const tastr::ast::LanguageTypeNode& node) {
        ++size_;
        update_counter_(node);
    }

    virtual void visit(const tastr::ast::SymbolTypeNode& node) {
        ++size_;
        update_counter_(node);
    }

    virtual void visit(const tastr::ast::ExternalPointerTypeNode& node) {
        ++size_;
        update_counter_(node);
    }

    virtual void visit(const tastr::ast::BytecodeTypeNode& node) {
        ++size_;
        update_counter_(node);
    }

    virtual void visit(const tastr::ast::PairlistTypeNode& node) {
        ++size_;
        update_counter_(node);
    }

    virtual void visit(const tastr::ast::S4TypeNode& node) {
        ++size_;
        update_counter_(node);
    }

    virtual void visit(const tastr::ast::WeakReferenceTypeNode& node) {
        ++size_;
        update_counter_(node);
    }

    virtual void visit(const tastr::ast::ClassTypeNode& node) {
        ++size_;
        update_counter_(node);
    }

    virtual void visit(const tastr::ast::AnyTypeNode& node) {
        ++size_;
        update_counter_(node);
    }

    virtual void visit(const tastr::ast::FunctionTypeNode& node) {
        /* 1 (any) + 1 (=>) + 1 (any)  */
        size_ += 3;
        update_counter_(node);
    }

    virtual void visit(const tastr::ast::ListTypeNode& node) {
        ++size_;
        update_counter_(node);
    }

    virtual void visit(const tastr::ast::StructTypeNode& node) {
        ++size_;
        update_counter_(node);
    }

    virtual void visit(const tastr::ast::TupleTypeNode& node) {
        ++size_;
        update_counter_(node);
    }

    virtual void visit(const tastr::ast::VarargTypeNode& node) {
        ++size_;
        update_counter_(node);
    }

    virtual void visit(const tastr::ast::NullTypeNode& node) {
        ++size_;
        update_counter_(node);
    }

    virtual void visit(const tastr::ast::IdentifierNode& node) {
        std::cerr << "Unexpected node: '" << tastr::parser::to_string(node)
                  << "'";
    }

    virtual void visit(const tastr::ast::KeywordNode& node) {
        std::cerr << "Unexpected node: '" << tastr::parser::to_string(node)
                  << "'";
    }

    virtual void visit(const tastr::ast::OperatorNode& node) {
        std::cerr << "Unexpected node: '" << tastr::parser::to_string(node)
                  << "'";
        exit(1);
    }

    virtual void visit(const tastr::ast::TerminatorNode& node) {
        std::cerr << "Unexpected node: '" << tastr::parser::to_string(node)
                  << "'";
        exit(1);
    }

    virtual void visit(const tastr::ast::SeparatorNode& node) {
        std::cerr << "Unexpected node: '" << tastr::parser::to_string(node)
                  << "'";
        exit(1);
    }

    virtual void visit(const tastr::ast::EmptyNode& node) {
        std::cerr << "Unexpected node: '" << tastr::parser::to_string(node)
                  << "'";
        exit(1);
    }

    virtual void visit(const tastr::ast::EofNode& node) {
        std::cerr << "Unexpected node: '" << tastr::parser::to_string(node)
                  << "'";
        exit(1);
    }

    virtual void visit(const tastr::ast::UnknownTypeNode& node) {
        std::cerr << "Unexpected node: '" << tastr::parser::to_string(node)
                  << "'";
        exit(1);
    }

    virtual void visit(const tastr::ast::CommaSeparatorNode& node) {
        std::cerr << "Unexpected node: '" << tastr::parser::to_string(node)
                  << "'";
        exit(1);
    }

    virtual void visit(const tastr::ast::ParameterNode& node) {
        std::cerr << "Unexpected node: '" << tastr::parser::to_string(node)
                  << "'";
        exit(1);
    }

    virtual void visit(const tastr::ast::GroupTypeNode& node) {
        std::cerr << "Unexpected node: '" << tastr::parser::to_string(node)
                  << "'";
        exit(1);
    }

    virtual void visit(const tastr::ast::UnionTypeNode& node) {
        std::cerr << "Unexpected node: '" << tastr::parser::to_string(node)
                  << "'";
        exit(1);
    }

    virtual void visit(const tastr::ast::IntersectionTypeNode& node) {
        std::cerr << "Unexpected node: '" << tastr::parser::to_string(node)
                  << "'";
        exit(1);
    }

    virtual void visit(const tastr::ast::NullableTypeNode& node) {
        std::cerr << "Unexpected node: '" << tastr::parser::to_string(node)
                  << "'";
        exit(1);
    }

    virtual void visit(const tastr::ast::TagTypePairNode& node) {
        std::cerr << "Unexpected node: '" << tastr::parser::to_string(node)
                  << "'";
        exit(1);
    }

    virtual void visit(const tastr::ast::TypeDeclarationNode& node) {
        std::cerr << "Unexpected node: '" << tastr::parser::to_string(node)
                  << "'";
        exit(1);
    }

    virtual void visit(const tastr::ast::TopLevelNode& node) {
        std::cerr << "Unexpected node: '" << tastr::parser::to_string(node)
                  << "'";
        exit(1);
    }

  private:
    void update_counter_(const tastr::ast::Node& node) {
        std::string key = tastr::parser::to_string(node);
        auto iter = counter_.find(key);
        if (iter == counter_.end()) {
            counter_.insert({key, 1});
        } else {
            ++iter->second;
        }
    }

    int size_;
    std::unordered_map<std::string, int> counter_;
};
