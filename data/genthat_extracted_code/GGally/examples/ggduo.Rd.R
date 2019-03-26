library(GGally)


### Name: ggduo
### Title: ggduo - A ggplot2 generalized pairs plot for two columns sets of
###   a data.frame
### Aliases: ggduo

### ** Examples

 # small function to display plots only if it's interactive
 p_ <- GGally::print_if_interactive

 data(baseball, package = "plyr")

 # Keep players from 1990-1995 with at least one at bat
 # Add how many singles a player hit
 # (must do in two steps as X1b is used in calculations)
 dt <- transform(
   subset(baseball, year >= 1990 & year <= 1995 & ab > 0),
   X1b = h - X2b - X3b - hr
 )
 # Add
 #  the player's batting average,
 #  the player's slugging percentage,
 #  and the player's on base percentage
 # Make factor a year, as each season is discrete
 dt <- transform(
   dt,
   batting_avg = h / ab,
   slug = (X1b + 2*X2b + 3*X3b + 4*hr) / ab,
   on_base = (h + bb + hbp) / (ab + bb + hbp),
   year = as.factor(year)
 )


 pm <- ggduo(
   dt,
   c("year", "g", "ab", "lg"),
   c("batting_avg", "slug", "on_base"),
   mapping = ggplot2::aes(color = lg)
 )
 # Prints, but
 #   there is severe over plotting in the continuous plots
 #   the labels could be better
 #   want to add more hitting information
 p_(pm)

 # address overplotting issues and add a title
 pm <- ggduo(
   dt,
   c("year", "g", "ab", "lg"),
   c("batting_avg", "slug", "on_base"),
   columnLabelsX = c("year", "player game count", "player at bat count", "league"),
   columnLabelsY = c("batting avg", "slug %", "on base %"),
   title = "Baseball Hitting Stats from 1990-1995",
   mapping = ggplot2::aes(color = lg),
   types = list(
     # change the shape and add some transparency to the points
     continuous = wrap("smooth_loess", alpha = 0.50, shape = "+")
   ),
   showStrips = FALSE
 );

 p_(pm)



# Example derived from:
## R Data Analysis Examples | Canonical Correlation Analysis.  UCLA: Institute for Digital
##   Research and Education.
##   from http://www.stats.idre.ucla.edu/r/dae/canonical-correlation-analysis
##   (accessed May 22, 2017).
# "Example 1. A researcher has collected data on three psychological variables, four
#  academic variables (standardized test scores) and gender for 600 college freshman.
#  She is interested in how the set of psychological variables relates to the academic
#  variables and gender. In particular, the researcher is interested in how many
#  dimensions (canonical variables) are necessary to understand the association between
#  the two sets of variables."
data(psychademic)
summary(psychademic)

(psych_variables <- attr(psychademic, "psychology"))
(academic_variables <- attr(psychademic, "academic"))

## Within correlation
p_(ggpairs(psychademic, columns = psych_variables))
p_(ggpairs(psychademic, columns = academic_variables))

## Between correlation
loess_with_cor <- function(data, mapping, ..., method = "pearson") {
  x <- eval(mapping$x, data)
  y <- eval(mapping$y, data)
  cor <- cor(x, y, method = method)
  ggally_smooth_loess(data, mapping, ...) +
    ggplot2::geom_label(
      data = data.frame(
        x = min(x, na.rm = TRUE),
        y = max(y, na.rm = TRUE),
        lab = round(cor, digits = 3)
      ),
      mapping = ggplot2::aes(x = x, y = y, label = lab),
      hjust = 0, vjust = 1,
      size = 5, fontface = "bold",
      inherit.aes = FALSE # do not inherit anything from the ...
    )
}
pm <- ggduo(
  psychademic,
  rev(psych_variables), academic_variables,
  types = list(continuous = loess_with_cor),
  showStrips = FALSE
)
suppressWarnings(p_(pm)) # ignore warnings from loess

# add color according to sex
pm <- ggduo(
  psychademic,
  mapping = ggplot2::aes(color = sex),
  rev(psych_variables), academic_variables,
  types = list(continuous = loess_with_cor),
  showStrips = FALSE,
  legend = c(5,2)
)
suppressWarnings(p_(pm))


# add color according to sex
pm <- ggduo(
  psychademic,
  mapping = ggplot2::aes(color = motivation),
  rev(psych_variables), academic_variables,
  types = list(continuous = loess_with_cor),
  showStrips = FALSE,
  legend = c(5,2)
) +
  ggplot2::theme(legend.position = "bottom")
suppressWarnings(p_(pm))



