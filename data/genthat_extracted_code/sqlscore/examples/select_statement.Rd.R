library(sqlscore)


### Name: select_statement
### Title: Generate a SELECT statement from a model
### Aliases: select_statement

### ** Examples

# Basic select statements
mod <- glm(Sepal.Length ~ Sepal.Width + Petal.Length + Petal.Width + Species,
           data=datasets::iris)
select_statement(mod, src_table="tbl_name")
select_statement(mod, src_table="tbl_name", src_schema="schema_name",
                 src_catalog="catalog_name")
select_statement(mod, src_table="tbl_name", src_schema="schema_name",
                 src_catalog="catalog_name", pk=c("lab", "specimen_id"))

#With a custom response function
select_statement(mod, src_table="tbl_name", src_schema="schema_name",
                 response="probit")

# With a model-derived non-identity response function
mod <- glm(Sepal.Length > 5.0 ~ Sepal.Width + Petal.Length + Petal.Width + Species,
           data=datasets::iris, family=binomial("logit"))
select_statement(mod, src_table="tbl_name")

#With formula operators
x <- matrix(rnorm(100*20),100,20)
colnames(x) <- sapply(1:20, function(x) paste0("X", as.character(x)))
x <- as.data.frame(x)
mod <- glm(X2 ~ X3 + X5 + X15*X8, data=x)
select_statement(mod, src_table="tbl_name")
select_statement(mod, src_table="tbl_name", response="cauchit")




