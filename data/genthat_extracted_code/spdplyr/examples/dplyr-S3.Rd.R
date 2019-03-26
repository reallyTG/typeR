library(spdplyr)


### Name: dplyr-S3
### Title: dplyr S3 methods
### Aliases: dplyr-S3 tbl_vars.Spatial dplyr-S3 groups.Spatial

### ** Examples

if (utils::packageVersion("dplyr") > "0.5.0") {

spmap %>% mutate_if(is.numeric, as.character)
spmap %>% mutate_all(funs(as.character))
spmap %>% mutate_at(vars(starts_with("L")), funs(as.integer))
}



