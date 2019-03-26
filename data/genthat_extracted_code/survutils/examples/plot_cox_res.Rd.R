library(survutils)


### Name: plot_cox_res
### Title: Plot Cox Regression Results
### Aliases: plot_cox_res

### ** Examples

## Not run: 
##D library("survival")
##D library("magrittr")
##D library("dplyr")
##D 
##D in.df <- colon
##D endpoint <- "time"
##D endpoint.code <- "status"
##D 
##D # Run and Plot Multivariate Cox Regression on Entire data.frame
##D features <- c("age", "obstruct")
##D cox.res.df <- get_cox_res(colon, endpoint, endpoint.code, features)
##D plot_cox_res(cox.res.df)
##D 
##D # Run and Plot Multivariate Cox Regression For Each rx Group
##D group <- "rx"
##D cox.res.df <- get_cox_res(colon, endpoint, endpoint.code, features, group)
##D plot_cox_res(cox.res.df, facet.formula = ". ~ group")
##D 
##D # Change x and y labels
##D plot_cox_res(cox.res.df, facet.formula = ". ~ group", 
##D              x.lab = "Hazard Ratio", y.lab = "Feature")
##D 
##D # Adding colors
##D cox.res.df %>%
##D   mutate(sig_flag = p.value < 0.05) %>%
##D   plot_cox_res(facet.formula = ". ~ group", x.lab = "Hazard Ratio", 
##D                y.lab = "Feature", 
##D                color.col = "sig_flag", 
##D                color.legend.name = "Significant Flag")
##D 
##D # Flipping Plot
##D cox.res.df %>%
##D   mutate(sig_flag = p.value < 0.05) %>%
##D   plot_cox_res(facet.formula = ". ~ group", x.lab = "Hazard Ratio", 
##D                y.lab = "Feature", 
##D                color.col = "sig_flag", 
##D                color.legend.name = "Significant Flag", 
##D                coord.flip = TRUE)
## End(Not run)



