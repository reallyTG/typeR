library(sbpiper)


### Name: scatterplot_ple
### Title: Plot a profile likelihood estimation (PLE) scatter plot
### Aliases: scatterplot_ple

### ** Examples

a <- rnorm(10000)
b <- a^2+10
df<-data.frame(a, b)
scatterplot_ple(df, colNameX="a", colNameY="b", conf_level_66=0)
scatterplot_ple(df, colNameX="a", colNameY="b", 
                conf_level_66=13, conf_level_95=16.5, conf_level_99=20)



