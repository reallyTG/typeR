library(dint)


### Name: scale_date_xx
### Title: ggplot2 Scales For date_xx Objects
### Aliases: scale_date_xx scale_x_date_yq scale_y_date_yq scale_x_date_ym
###   scale_y_date_ym scale_x_date_yw scale_y_date_yw

### ** Examples

if (require("ggplot2", quietly = TRUE)){

dd <- data.frame(date = seq(date_yq(2016, 1), date_yq(2018, 1)), V1 = 1:9)
p <- ggplot(dd, aes(x = date, y = V1)) +
  geom_point()

p  # automatically uses the proper scale
p + scale_x_date_yq("quarters with default spacing")
p + scale_x_date_yq(breaks = date_yq_breaks(3))


# Different ways to specify breaks and labels
p <- ggplot(
  data.frame(date = seq(date_yq(2012, 4), date_yq(2018, 4)), V1 = 1:25),
  aes(x = date, y = V1)
) +
  geom_point()

p + scale_x_date_yq(labels = waiver()) + ggtitle("auto Labels")
p + scale_x_date_yq(labels = NULL) + ggtitle("no Labels")
p + scale_x_date_yq(labels = LETTERS[1:4]) + ggtitle("manual Labels")
p + scale_x_date_yq(labels = format_yq_iso) + ggtitle("function Labels")

p + scale_x_date_yq(breaks = waiver()) + ggtitle("auto breaks")
p + scale_x_date_yq(breaks = NULL) + ggtitle("no breaks")
p + scale_x_date_yq(breaks = date_yq(2013, 2:3) ) + ggtitle("manual breaks")
p + scale_x_date_yq(breaks = date_yq_breaks(1) ) + ggtitle("function breaks")
}



