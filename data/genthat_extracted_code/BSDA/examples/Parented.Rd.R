library(BSDA)


### Name: Parented
### Title: Education backgrounds of parents of entering freshmen at a state
###   university
### Aliases: Parented
### Keywords: datasets

### ** Examples


T1 <- xtabs(~education + parent, data = Parented)
T1
barplot(t(T1), beside = TRUE, legend = TRUE, col = c("blue", "red"))
rm(T1)
## Not run: 
##D library(ggplot2)
##D ggplot2::ggplot(data = Parented, aes(x = education, fill = parent)) + 
##D     geom_bar(position = "dodge") + 
##D     theme_bw() +
##D     theme(axis.text.x  = element_text(angle = 85, vjust = 0.5)) + 
##D     scale_fill_manual(values = c("pink", "blue")) + 
##D     labs(x = "", y = "") 
## End(Not run)
          



