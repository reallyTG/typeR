library(R.devices)


### Name: devOptions
### Title: Gets the default device options
### Aliases: devOptions getDevOption
### Keywords: device utilities

### ** Examples

# Tabulate some of the default settings for known devices
print(devOptions()[,c("width", "height", "bg", "fg", "pointsize")])



