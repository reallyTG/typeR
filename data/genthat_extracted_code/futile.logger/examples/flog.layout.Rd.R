library(futile.logger)


### Name: flog.layout
### Title: Manage layouts within the 'futile.logger' sub-system
### Aliases: flog.layout layout.format layout.json layout.simple
###   layout.tracearg
### Keywords: data

### ** Examples

# Set the layout for 'my.package'
flog.layout(layout.simple, name='my.package')

# Update the ROOT logger to use a custom layout
layout <- layout.format('[~l] [~t] [~n.~f] ~m')
flog.layout(layout)

# Create a custom logger to trace variables
flog.layout(layout.tracearg, name='tracer')
x <- 5
flog.info(x, name='tracer')



