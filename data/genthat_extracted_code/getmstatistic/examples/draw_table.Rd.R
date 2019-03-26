library(getmstatistic)


### Name: draw_table
### Title: Helper function to draw table grobs.
### Aliases: draw_table

### ** Examples

# note: not exported hence examples are not run
library(gridExtra)

## No test: 

# Table of iris values
iris_dframe <- head(iris)
title_iris_dframe <- paste("Table: Length and width measurements (cm) of sepals ",
                       "and petals, for 50 flowers from 3 species of iris ", 
                       "(setosa, versicolor, and virginica). ", sep="")
table_influential_studies <-  draw_table(body = iris_dframe, heading = title_iris_dframe)

# Table of mtcars values 
mtcars_dframe <- head(mtcars)
title_mtcars_dframe <- paste("Table: Motor Trend US magazine (1974) automobile ",
                        "statistics for fuel consumption, automobile ", 
                        "design and performance. ", sep="")
table_influential_studies <-  draw_table(body = mtcars_dframe, 
                                          heading = title_mtcars_dframe)
## End(No test)
# @export



