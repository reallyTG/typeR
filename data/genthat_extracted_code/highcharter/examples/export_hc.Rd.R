library(highcharter)


### Name: export_hc
### Title: Function to export js file the configuration options
### Aliases: export_hc

### ** Examples


fn <- "function(){
  console.log('Category: ' + this.category);
  alert('Category: ' + this.category);
}"

hc <- highcharts_demo() %>% 
  hc_plotOptions(
    series = list(
      cursor = "pointer",
        point = list(
          events = list(
            click = JS(fn)
         )
       )
   )
 )

## Not run: 
##D export_hc(hc, filename = "~/hc_is.js", as = "is")
##D export_hc(hc, filename = "~/hc_vr.js", as = "variable", name = "objectname")
##D export_hc(hc, filename = "~/hc_ct.js", as = "container", name = "#selectorid")
## End(Not run)




