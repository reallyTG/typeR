library(RcppCWB)


### Name: cqp_list_corpora
### Title: List Available CWB Corpora.
### Aliases: cqp_list_corpora

### ** Examples

if (!cqp_is_initialized()){
  registry <- system.file(package = "RcppCWB", "extdata", "cwb", "registry")
  cqp_initialize(registry)
}
cqp_list_corpora()



