library(cliapp)


### Name: cli_alert
### Title: CLI alerts
### Aliases: cli_alert cli_alert_success cli_alert_danger cli_alert_warning
###   cli_alert_info

### ** Examples


cli_alert("Cannot lock package library.")
cli_alert_success("Package {pkg cliapp} installed successfully.")
cli_alert_danger("Could not download {pkg cliapp}.")
cli_alert_warning("Internet seems to be unreacheable.")
cli_alert_info("Downloaded 1.45MiB of data")



