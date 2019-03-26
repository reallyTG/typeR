library(SQRL)


### Name: sqrlAll
### Title: Broadcast a Command to All Data Sources
### Aliases: sqrlAll
### Keywords: misc

### ** Examples

# Show all interfaces (visible return).
sqrlAll("interface")

# Do not convert strings to factors.
sqrlAll("stringsAsFactors", FALSE)

# Enable all connection indicators.
sqrlAll(visible = TRUE)

# Close all open channels.
sqrlAll("close")

# Remove all defined sources.
sqrlAll("remove")



