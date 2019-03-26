library(rLDCP)


### Name: report_template
### Title: Define the report template
### Aliases: report_template

### ** Examples

properties = NULL
report_method <- function(properties,pm){
  pm_report(pm$pm_frame)
}
my_report <- report_template(properties,
                    report_method)



