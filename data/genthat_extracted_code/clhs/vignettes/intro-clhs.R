## ----make_things_reproducible, echo=FALSE, eval=TRUE---------------------
set.seed(42)

## ----load_diamonds-------------------------------------------------------
data(diamonds, package = 'ggplot2')
diamonds <- data.frame(diamonds)
head(diamonds)
nrow(diamonds)

## ----simple_clhs, echo=TRUE, eval=TRUE-----------------------------------
library(clhs)
res <- clhs(diamonds, size = 100, progress = FALSE, iter = 1000)
str(res)

## ----existing_samples, echo=TRUE, eval=TRUE------------------------------
set.seed(1)

candidates_samples <- data.frame(
  x = runif(500),
  y = rnorm(500, mean = 0.5, sd = 0.5)
)

existing_samples <- data.frame(
  x = runif(5),
  y = runif(5)
) 

res <- clhs(
  x = rbind(existing_samples, candidates_samples), 
  size = 10, 
  iter = 100, 
  include = 1:5, 
  progress = FALSE
)

## ----plot_mandatory_1, echo=FALSE, fig=TRUE, fig.height=6, fig.width=6----
suppressPackageStartupMessages(library(ggplot2))

res_df <- rbind(existing_samples, candidates_samples)
res_df$mandatory_sample <- c(rep(TRUE, length.out = 5), rep(FALSE, length.out = 500))
res_df$selected_sample <- FALSE
res_df$selected_sample[res] <- TRUE

p0 <- ggplot(data = res_df, mapping = aes(x = x, y = y)) +
  geom_point(aes(colour = mandatory_sample, size = mandatory_sample, shape = mandatory_sample)) +
  scale_colour_manual(values = c("grey70", "red")) +
  scale_size_manual(values = c(2, 4)) +
  theme_bw()

print(p0)

## ----plot_mandatory_2, echo=FALSE, fig=TRUE, fig.height=6, fig.width=6----
p1 <- ggplot(data = res_df, mapping = aes(x = x, y = y)) +
  geom_point(aes(colour = selected_sample, size = selected_sample, shape = mandatory_sample)) +
  scale_colour_manual(values = c("grey70", "red")) +
  scale_size_manual(values = c(2, 4)) +
  theme_bw()

print(p1)

## ----cost_clhs, echo=TRUE, eval=TRUE-------------------------------------
diamonds$cost <- runif(nrow(diamonds))
res_cost <- clhs(diamonds, size = 100, progress = FALSE, iter = 1000, cost = 'cost')

## ----plot_clhs_1, echo=TRUE, fig=TRUE, fig.height=8, fig.width=8---------
res <- clhs(diamonds, size = 100, simple = FALSE, progress = FALSE, iter = 1000)
plot(res)

## ----plot_clhs_3, echo=TRUE, fig=TRUE, fig.height=8, fig.width=12--------
res_cost <- clhs(diamonds, size = 100, progress = FALSE, iter = 1000, cost = 'cost', simple = FALSE)
plot(res_cost, c('obj', 'cost'))

## ----plot_clhs_4, echo=TRUE, fig=TRUE, fig.height=8, fig.width=12, warning=FALSE----
plot(res_cost, c('obj', 'cost', 'box'))

