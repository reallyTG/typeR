library(BSDA)


### Name: Tonsils
### Title: Size of tonsils collected from 1,398 children
### Aliases: Tonsils
### Keywords: datasets

### ** Examples


T1 <- xtabs(~size + status, data = Tonsils)
T1
prop.table(T1, 1)
prop.table(T1, 1)[2, 1]
barplot(t(T1), legend = TRUE, beside = TRUE, col = c("red", "green"))
## Not run: 
##D library(dplyr)
##D library(ggplot2)
##D NDF <- dplyr::count(Tonsils, size, status) 
##D ggplot2::ggplot(data = NDF, aes(x = size, y = n, fill = status)) + 
##D            geom_bar(stat = "identity", position = "dodge") + 
##D            scale_fill_manual(values = c("red", "green")) + 
##D            theme_bw()
## End(Not run)




