library(cliapp)


### Name: cli_progress_bar
### Title: CLI progress bar
### Aliases: cli_progress_bar

### ** Examples

{
  p <- cli_progress_bar(total = 10)
  cli_alert_info("Starting computation")
  for (i in 1:10) { p$tick(); Sys.sleep(0.2) }
  cli_alert_success("Done")
}



