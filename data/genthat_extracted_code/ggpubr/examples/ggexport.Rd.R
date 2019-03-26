library(ggpubr)


### Name: ggexport
### Title: Export ggplots
### Aliases: ggexport

### ** Examples

## Not run: 
##D require("magrittr")
##D # Load data
##D data("ToothGrowth")
##D df <- ToothGrowth
##D df$dose <- as.factor(df$dose)
##D 
##D # Box plot
##D bxp <- ggboxplot(df, x = "dose", y = "len",
##D     color = "dose", palette = "jco")
##D # Dot plot
##D dp <- ggdotplot(df, x = "dose", y = "len",
##D     color = "dose", palette = "jco")
##D # Density plot
##D dens <- ggdensity(df, x = "len", fill = "dose", palette = "jco")
##D 
##D # Export to pdf
##D ggarrange(bxp, dp, dens, ncol = 2) %>%
##D   ggexport(filename = "test.pdf")
##D 
##D # Export to png
##D ggarrange(bxp, dp, dens, ncol = 2) %>%
##D   ggexport(filename = "test.png")
##D  
## End(Not run)




