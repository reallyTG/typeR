## ---- results='hide', echo=FALSE, message=FALSE-----------------------------------------------------------------------
library(crunch)
options(width=120)

## ---- eval=FALSE------------------------------------------------------------------------------------------------------
#  ds %>%
#      mkdir("This week/Snowden") %>%
#      mv(matches("snowden", ignore.case = TRUE), "This week/Snowden") %>%
#      cd("/") %>%
#      print(depth = 2)

