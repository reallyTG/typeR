library(qwraps2)


### Name: stat_stepribbon
### Title: Step ribbon statistic
### Aliases: stat_stepribbon

### ** Examples

x <- 1:10
df <- data.frame(x=x, y=x+10, ymin=x+7, ymax=x+12)

gg <- ggplot2::ggplot(df, ggplot2::aes(x, y))
gg <- gg + ggplot2::geom_ribbon(ggplot2::aes(ymin=ymin, ymax=ymax),
                                stat="stepribbon", fill="#b2b2b2")
gg <- gg + ggplot2::geom_step(color="#2b2b2b")
gg

gg <- ggplot2::ggplot(df, ggplot2::aes(x, y))
gg <- gg + ggplot2::geom_ribbon(ggplot2::aes(ymin=ymin, ymax=ymax),
                                stat="stepribbon", fill="#b2b2b2",
                                direction="hv")
gg <- gg + ggplot2::geom_step(color="#2b2b2b")
gg



