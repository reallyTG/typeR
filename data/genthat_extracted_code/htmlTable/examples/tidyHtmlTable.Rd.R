library(htmlTable)


### Name: tidyHtmlTable
### Title: Generate an htmlTable using a ggplot2-like interface
### Aliases: tidyHtmlTable

### ** Examples

## Not run: 
##D library(tidyverse)
##D mtcars %>%
##D     rownames_to_column %>%
##D     select(rowname, cyl, gear, hp, mpg, qsec) %>%
##D     gather(per_metric, value, hp, mpg, qsec) %>%
##D     group_by(cyl, gear, per_metric) %>%
##D     summarise(Mean = round(mean(value), 1),
##D               SD = round(sd(value), 1),
##D               Min = round(min(value), 1),
##D               Max = round(max(value), 1)) %>%
##D      gather(summary_stat, value, Mean, SD, Min, Max) %>%
##D      ungroup %>%
##D      mutate(gear = paste(gear, "Gears"),
##D             cyl = paste(cyl, "Cylinders")) %>%
##D      tidyHtmlTable(header = "gear",
##D                   cgroup1 = "cyl",
##D                   cell_value = "value",
##D                   rnames = "summary_stat",
##D                   rgroup = "per_metric")
## End(Not run)



