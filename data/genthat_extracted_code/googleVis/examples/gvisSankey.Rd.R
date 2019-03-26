library(googleVis)


### Name: gvisSankey
### Title: Google Sankey Chart with R
### Aliases: gvisSankey
### Keywords: iplot

### ** Examples

dat <- data.frame(From=c(rep("A",3), rep("B", 3)), 
                  To=c(rep(c("X", "Y", "Z"),2)), 
                  Weight=c(5,7,6,2,9,4))

sk1 <- gvisSankey(dat, from="From", to="To", weight="Weight")
plot(sk1)

sk2 <- gvisSankey(dat, from="From", to="To", weight="Weight",
                options=list(sankey="{link: {color: { fill: '#d799ae' } },
                                     node: { color: { fill: '#a61d4c' },
                                     label: { color: '#871b47' } }}"))
plot(sk2)




