library(RcppCWB)


### Name: RcppCWB-package
### Title: Rcpp Bindings for the Corpus Workbench (CWB).
### Aliases: RcppCWB-package RcppCWB
### Keywords: package

### ** Examples

# functions of the corpus library (starting with cl) expose the low-level
# access to the CWB corpus library (CL)

# registry <- if (!check_pkg_registry_files()) use_tmp_registry() else get_pkg_registry()
registry <- use_tmp_registry()
print(registry)
ids <- cl_cpos2id("REUTERS", cpos = 1:20, p_attribute = "word", registry = registry)
tokens <- cl_id2str("REUTERS", id = ids, p_attribute = "word", registry = registry)
print(paste(tokens, collapse = " "))

# To use the corpus query processor (CQP) and its syntax, it is necessary first
# to initialize CQP (example: get concordances of 'oil')

cqp_initialize(registry)
cqp_query("REUTERS", query = '[]{5} "oil" []{5}')
cpos_matrix <- cqp_dump_subcorpus("REUTERS")
concordances_oil <- apply(
  cpos_matrix, 1,
  function(row){
    ids <- cl_cpos2id("REUTERS", p_attribute = "word", cpos = row[1]:row[2])
    tokens <- cl_id2str("REUTERS", p_attribute = "word", id = ids)
    paste(tokens, collapse = " ")
  }
 )




