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
        ++size_;
        update_counter_(node);
    }

    virtual void visit(const tastr::ast::IdentifierNode& node) {
        ++size_;
        update_counter_(node);
    }

    virtual void visit(const tastr::ast::KeywordNode& node) {
        ++size_;
        update_counter_(node);
    }

    virtual void visit(const tastr::ast::OperatorNode& node) {
        ++size_;
        update_counter_(node);
    }

    virtual void visit(const tastr::ast::TerminatorNode& node) {
        ++size_;
        update_counter_(node);
    }

    virtual void visit(const tastr::ast::SeparatorNode& node) {
        ++size_;
        update_counter_(node);
    }

    virtual void visit(const tastr::ast::EmptyNode& node) {
        ++size_;
        update_counter_(node);
    }

    virtual void visit(const tastr::ast::EofNode& node) {
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
        ++size_;
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

    virtual void visit(const tastr::ast::UnknownTypeNode& node) {
        ++size_;
        update_counter_(node);
    }

    virtual void visit(const tastr::ast::CommaSeparatorNode& node) {
        ++size_;
        update_counter_(node);
    }

    virtual void visit(const tastr::ast::ParameterNode& node) {
        ++size_;
        update_counter_(node);
    }

    virtual void visit(const tastr::ast::FunctionTypeNode& node) {
        ++size_;
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

    virtual void visit(const tastr::ast::GroupTypeNode& node) {
        ++size_;
        update_counter_(node);
    }

    virtual void visit(const tastr::ast::UnionTypeNode& node) {
        ++size_;
        update_counter_(node);
    }

    virtual void visit(const tastr::ast::IntersectionTypeNode& node) {
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

    virtual void visit(const tastr::ast::NullableTypeNode& node) {
        ++size_;
        update_counter_(node);
    }

    virtual void visit(const tastr::ast::TagTypePairNode& node) {
        ++size_;
        update_counter_(node);
    }

    virtual void visit(const tastr::ast::TypeDeclarationNode& node) {
        ++size_;
        update_counter_(node);
    }

    virtual void visit(const tastr::ast::TopLevelNode& node) {
        ++size_;
        update_counter_(node);
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
