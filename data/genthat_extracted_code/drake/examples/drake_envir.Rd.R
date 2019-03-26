library(drake)


### Name: drake_envir
### Title: Get the environment where drake builds targets
### Aliases: drake_envir

### ** Examples

plan <- drake_plan(
  large_data_1 = sample.int(1e4),
  large_data_2 = sample.int(1e4),
  subset = c(large_data_1[seq_len(10)], large_data_2[seq_len(10)]),
  summary = {
    print(ls(envir = drake_envir()))
    # We don't need the large_data_* targets in memory anymore.
    rm(large_data_1, large_data_2, envir = drake_envir())
    print(ls(envir = drake_envir()))
    mean(subset)
  },
  strings_in_dots = "literals"
)
make(plan, cache = storr::storr_environment(), session_info = FALSE)



