library(gifski)


### Name: gifski
### Title: Gifski
### Aliases: gifski save_gif

### ** Examples

# Manually convert png files to gif
png_path <- file.path(tempdir(), "frame%03d.png")
png(png_path)
par(ask = FALSE)
for(i in 1:10)
  plot(rnorm(i * 10), main = i)
dev.off()
png_files <- sprintf(png_path, 1:10)
gif_file <- tempfile(fileext = ".gif")
gifski(png_files, gif_file)
unlink(png_files)
## No test: 
utils::browseURL(gif_file)
## End(No test)

## No test: 
# Example borrowed from gganimate
library(gapminder)
library(ggplot2)
makeplot <- function(){
  datalist <- split(gapminder, gapminder$year)
  lapply(datalist, function(data){
    p <- ggplot(data, aes(gdpPercap, lifeExp, size = pop, color = continent)) +
      scale_size("population", limits = range(gapminder$pop)) + geom_point() + ylim(20, 90) +
      scale_x_log10(limits = range(gapminder$gdpPercap)) + ggtitle(data$year) + theme_classic()
    print(p)
  })
}

# High Definition images:
gif_file <- file.path(tempdir(), 'gapminder.gif')
save_gif(makeplot(), gif_file, 1280, 720, res = 144)
utils::browseURL(gif_file)
## End(No test)



