library(drake)


### Name: target
### Title: Define custom columns in a 'drake_plan()'.
### Aliases: target

### ** Examples

# Use target() to create your own custom columns in a drake plan.
# See ?triggers for more on triggers.
plan <- drake_plan(
  website_data = target(
    download_data("www.your_url.com"),
    trigger = "always",
    custom_column = 5
  ),
  analysis = analyze(website_data),
  strings_in_dots = "literals"
)
plan
# make(plan) # nolint
# Call target() inside or outside drake_plan().
target(
  download_data("www.your_url.com"),
  trigger = "always",
  custom_column = 5
)



