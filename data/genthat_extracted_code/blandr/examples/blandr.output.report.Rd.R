library(blandr)


### Name: blandr.output.report
### Title: Bland-Altman report generator
### Aliases: blandr.output.report

### ** Examples

# NOT RUN
# Generates two random measurements
# measurement1 <- rnorm(100)
# measurement2 <- rnorm(100)

# blandr.output.report( measurement1 , measurement2 )
#
# Use this to manually run the rmarkdown template
# However specify where the template is
# Also define your methods as method1 and method2 exactly
# For a reason I can't fathom (or how the list of parameters is constructed)
# not naming them method1 and method2 makes them invisible to the rMarkdown document
#
# rmarkdown::run( file = "blandr_report_template.Rmd" ,
#      render_args = list( runtime = "shiny" ,
#          params = list( method1 = method1 ,
#               method2 = method2 ) ) )
# END OF NOT RUN




