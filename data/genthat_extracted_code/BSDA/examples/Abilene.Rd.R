library(BSDA)


### Name: Abilene
### Title: Crimes reported in Abilene, Texas
### Aliases: Abilene
### Keywords: datasets

### ** Examples


par(mfrow = c(2, 1))
barplot(Abilene$number[Abilene$year=="1992"],
names.arg = Abilene$crimetype[Abilene$year == "1992"],
main = "1992 Crime Stats", col = "red")
barplot(Abilene$number[Abilene$year=="1999"],
names.arg = Abilene$crimetype[Abilene$year == "1999"],
main = "1999 Crime Stats", col = "blue")
par(mfrow = c(1, 1))

## Not run: 
##D library(ggplot2)
##D ggplot2::ggplot(data = Abilene, aes(x = crimetype, y = number, fill = year)) +
##D            geom_bar(stat = "identity", position = "dodge") +
##D            theme_bw() +
##D            theme(axis.text.x = element_text(angle = 30, hjust = 1))
## End(Not run)




