## ---- warning=FALSE, message=FALSE---------------------------------------
library(csp)
library(ggplot2)

data(csp, package = "csp")
dim(csp)
names(csp)
csp[1:2, ]

## ---- fig.width = 6, fig.height = 4, warning=FALSE, message=FALSE--------
df <- subset(csp, variable == "real2_pc_inc_quar")
df$value <- as.numeric(df$value)

ggplot(df, aes(x = year, y = value, color = state)) +
  geom_line(show.legend = FALSE) +
  scale_color_grey() +
  theme_light() +
  labs(x = NULL, y = NULL,
       title = df$var_desc[1],
       subtitle = df$var_long_desc[1])

