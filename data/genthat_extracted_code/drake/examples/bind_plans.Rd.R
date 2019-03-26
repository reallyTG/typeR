library(drake)


### Name: bind_plans
### Title: Row-bind together drake plans
### Aliases: bind_plans

### ** Examples

# You might need to refresh your data regularly (see ?triggers).
download_plan <- drake_plan(
  data = target(
    command = download_data(),
    trigger = "always"
  ),
  strings_in_dots = "literals"
)
# But if the data don't change, the analyses don't need to change.
analysis_plan <- drake_plan(
  usage = get_usage_metrics(data),
  topline = scrape_topline_table(data)
)
your_plan <- bind_plans(download_plan, analysis_plan)
your_plan
# make(your_plan) # nolint



