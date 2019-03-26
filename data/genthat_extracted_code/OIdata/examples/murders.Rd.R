library(OIdata)


### Name: murders
### Title: London Murders, 2006-2011
### Aliases: murders
### Keywords: datasets London murder crime map

### ** Examples

data(murders)
date1    <- as.Date(murders$date,"%m/%d/%y")
date2    <- julian(date1,origin = as.Date("2006-01-02"))
date_cut <- cut(date2, seq(0, 2073, 90))
barplot(table(date_cut), xaxt = "n",
        xlab = "date from 01/2006 - 09/2011",
        ylab = "n deaths per 90 days")

## Not run: 
##D # install.packages("ggplot2")
##D # install.packages("RColorBrewer")
##D library(ggplot2)
##D library(RColorBrewer)
##D data(london_boroughs)
##D LB          <- london_boroughs
##D mtab        <- table(murders$borough)
##D LB$nmurders <- rep(mtab, rle(as.character(LB$name))$lengths)
##D p           <- ggplot()
##D p +
##D   geom_polygon(data=LB, aes(x=x, y=y, group = name, fill = nmurders),
##D                colour="white" ) +
##D   scale_fill_gradientn(colours = brewer.pal(7, "Blues"),
##D                limits=range(LB$nmurders))
## End(Not run)



