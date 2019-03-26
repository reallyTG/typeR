library(drake)


### Name: drake_plan_source
### Title: Show the code required to produce a given workflow plan data
###   frame
### Aliases: drake_plan_source

### ** Examples

plan <- drake::drake_plan(
  small_data = download_data("https://some_website.com"),
  large_data_raw = target(
    command = download_data("https://lots_of_data.com"),
    trigger = trigger(
      change = time_last_modified("https://lots_of_data.com"),
      command = FALSE,
      depend = FALSE
    ),
    timeout = 1e3
  ),
  strings_in_dots = "literals"
)
print(plan)
if (requireNamespace("styler", quietly = TRUE)) {
  source <- drake_plan_source(plan)
  print(source) # Install the prettycode package for syntax highlighting.
}
## Not run: 
##D file <- tempfile() # Path to an R script to contain the drake_plan() call.
##D writeLines(source, file) # Save the code to an R script.
## End(Not run)



