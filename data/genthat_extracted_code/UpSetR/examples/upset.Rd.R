library(UpSetR)


### Name: upset
### Title: UpSetR Plot
### Aliases: upset

### ** Examples

movies <- read.csv( system.file("extdata", "movies.csv", package = "UpSetR"), header=TRUE, sep=";" )

require(ggplot2); require(plyr); require(gridExtra); require(grid);

between <- function(row, min, max){
  newData <- (row["ReleaseDate"] < max) & (row["ReleaseDate"] > min)
}

plot1 <- function(mydata, x){
  myplot <- (ggplot(mydata, aes_string(x= x, fill = "color"))
            + geom_histogram() + scale_fill_identity()
            + theme(plot.margin = unit(c(0,0,0,0), "cm")))
}

plot2 <- function(mydata, x, y){
  myplot <- (ggplot(data = mydata, aes_string(x=x, y=y, colour = "color"), alpha = 0.5)
            + geom_point() + scale_color_identity()
            + theme_bw() + theme(plot.margin = unit(c(0,0,0,0), "cm")))
}

attributeplots <- list(gridrows = 55,
                  plots = list(list(plot = plot1, x= "ReleaseDate",  queries = FALSE),
                         list(plot = plot1, x= "ReleaseDate", queries = TRUE),
                         list(plot = plot2, x = "ReleaseDate", y = "AvgRating", queries = FALSE),
                         list(plot = plot2, x = "ReleaseDate", y = "AvgRating", queries = TRUE)),
                   ncols = 3)

upset(movies, nsets = 7, nintersects = 30, mb.ratio = c(0.5, 0.5),
      order.by = c("freq", "degree"), decreasing = c(TRUE,FALSE))

upset(movies, sets = c("Drama", "Comedy", "Action", "Thriller", "Western", "Documentary"),
      queries = list(list(query = intersects, params = list("Drama", "Action")),
                list(query = between, params = list(1970, 1980), color = "red", active = TRUE)))

upset(movies, attribute.plots = attributeplots,
     queries = list(list(query = between, params = list(1920, 1940)),
                    list(query = intersects, params = list("Drama"), color= "red"),
                    list(query = elements, params = list("ReleaseDate", 1990, 1991, 1992))),
      main.bar.color = "yellow")
      



