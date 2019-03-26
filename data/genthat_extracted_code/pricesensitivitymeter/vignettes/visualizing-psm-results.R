## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- echo=TRUE----------------------------------------------------------
library(pricesensitivitymeter)
set.seed(20)

toocheap <- round(rnorm(n = 250, mean = 8, sd = 1.5), digits = 2)
cheap <- round(rnorm(n = 250, mean = 12, sd = 2), digits = 2)
expensive <- round(rnorm(n = 250, mean = 13, sd = 1), digits = 2)
tooexpensive <- round(rnorm(n = 250, mean = 15, sd = 1), digits = 2)

# optional: purchase intent for "cheap" and "expensive price" (Newton Miller Smith Extension)
pi_cheap <- sample(x = c(1:5), size = length(cheap),
  replace = TRUE, prob = c(0.1, 0.1, 0.2, 0.3, 0.3))

pi_expensive <- sample(x = c(1:5), size = length(expensive),
  replace = TRUE, prob = c(0.3, 0.3, 0.2, 0.1, 0.1))

data.psm <- data.frame(toocheap, cheap, expensive, tooexpensive,
                       pi_cheap, pi_expensive)

output.psm <- psm_analysis(toocheap = "toocheap",
                           cheap = "cheap",
                           expensive = "expensive",
                           tooexpensive = "tooexpensive",
                           data = data.psm,
                           pi_cheap = "pi_cheap",
                           pi_expensive = "pi_expensive",
                           validate = TRUE)

## ---- echo=TRUE----------------------------------------------------------
output.psm$data_vanwestendorp[260, ]

## ---- fig.width = 7, fig.height = 4.5------------------------------------
library(ggplot2)

# all plot elements without any labels 
psmplot <-  ggplot(data = output.psm$data_vanwestendorp, aes(x = price)) +
  annotate(geom = "rect", # shaded background area for range of acceptable prices
           xmin = output.psm$pricerange_lower,
           xmax = output.psm$pricerange_upper,
           ymin = 0, ymax = Inf,
           fill="grey50", alpha = 0.3) +
  geom_line(aes(y = ecdf_toocheap, # line: too cheap
                colour = "too cheap",
                linetype = "too cheap"),
            size= 1) +
  geom_line(aes(y = ecdf_tooexpensive, # line: too expensive
                colour = "too expensive",
                linetype = "too expensive"),
            size = 1) + 
  geom_line(aes(y = ecdf_not_cheap, # line: not cheap
                colour = "not cheap",
                linetype = "not cheap"),
            size = 1) +
  geom_line(aes(y = ecdf_not_expensive, # line: not expensive
                colour = "not expensive",
                linetype = "not expensive"),
            size = 1) + 
  annotate(geom = "point", # Indifference Price Point (intersection of "cheap" and "expensive")
           x = output.psm$idp, 
           y = output.psm$data_vanwestendorp$ecdf_not_cheap[output.psm$data_vanwestendorp$price == output.psm$idp],
           size = 5,
           shape = 18,
           colour = "#009E73") + 
  annotate(geom = "point", # Optimal Price Point (intersection of "too cheap" and "too expensive")
           x = output.psm$opp, 
           y = output.psm$data_vanwestendorp$ecdf_toocheap[output.psm$data_vanwestendorp$price == output.psm$opp],
           size = 3,
           shape = 17,
           colour = "#009E73")


# Labels and Colours
psmplot +
  labs(x = "Price",
       y = "Share of Respondents (0-1)",
       title = "Price Sensitivity Meter Plot",
       caption = "Shaded area: range of acceptable prices\nData: Randomly generated")  + 
  scale_colour_manual(name = "Legend",
                      values = c("too cheap" = "#009E73",
                                 "not cheap" = "#009E73",
                                 "not expensive" = "#D55E00",
                                 "too expensive" = "#D55E00")) + 
  scale_linetype_manual(name="Legend",
                        values = c("too cheap" = "dotted",
                                   "not cheap" = "solid",
                                   "not expensive" = "solid",
                                   "too expensive" = "dotted")) + 
  annotate(geom = "text", # Label of Indifference Price Point
           x = output.psm$idp + 1.5, 
           y = output.psm$data_vanwestendorp$ecdf_not_cheap[output.psm$data_vanwestendorp$price == output.psm$idp],
           label = paste("IDP: ", output.psm$idp)) + 
  annotate(geom = "text", # Label of Optimal Price Point
           x = output.psm$opp + 1.5,
           y = output.psm$data_vanwestendorp$ecdf_toocheap[output.psm$data_vanwestendorp$price == output.psm$opp],
           label = paste("OPP: ", output.psm$opp)) +
  theme_minimal()

## ---- fig.width=7, fig.height=4.5----------------------------------------
par(cex.sub = 0.66) # reducing the font size of the subtitle

# Setting up the plot: empty canvas
plot(x = output.psm$data_vanwestendorp$price,
     y = output.psm$data_vanwestendorp$ecdf_toocheap,
     type = "n",
     xlab = "",
     ylab = "")

grid() # adding gridlines

# Shaded Area: Range of Accetable Prices
rect(xleft = output.psm$pricerange_lower,
     ybottom = 0,
     xright = output.psm$pricerange_upper,
     ytop = 1,
     col = "grey85",
     border = 0)

# adding line: too cheap
lines(x = output.psm$data_vanwestendorp$price,
      y = output.psm$data_vanwestendorp$ecdf_toocheap,
      lty = "dotted",
      col = "#009E73")

# adding line: not cheap
lines(x = output.psm$data_vanwestendorp$price,
      y = output.psm$data_vanwestendorp$ecdf_not_cheap,
      lty = "solid",
      col = "#009E73")

# adding line: not expensive
lines(x = output.psm$data_vanwestendorp$price,
      y = output.psm$data_vanwestendorp$ecdf_not_expensive,
      lty = "solid",
      col = "#D55E00")

# adding line: too expensive
lines(x = output.psm$data_vanwestendorp$price,
      y = output.psm$data_vanwestendorp$ecdf_tooexpensive,
      lty = "dotted",
      col = "#D55E00")

# adding the axes descriptions
title(main = "Price Sensitivity Meter Plot",
      xlab = "Price",
      ylab = "Share of Respondents (0-1)")

# Right-align of subtitle
adj.old <- par()$adj # saving old default value (= centered)
par(adj = 1) # setting the new default to right-align
title(sub = "Shaded area: Range of acceptable prices.\nData: Randomly generated") # writing the actual subtitle
par(adj = adj.old) # restore standard (so that next main title is again centered)

# adding the Indifference Price Point (intersection of "cheap" and "expensive")
points(x = output.psm$idp,
       y = output.psm$data_vanwestendorp$ecdf_not_cheap[which(output.psm$data_vanwestendorp$price == output.psm$idp)],
       cex = 2,
       pch = 18,
       col = "#009E73")

text(x = output.psm$idp,
     y = output.psm$data_vanwestendorp$ecdf_not_cheap[which(output.psm$data_vanwestendorp$price == output.psm$idp)],
     labels = paste("IDP:", output.psm$idp),
     pos = 4)

# adding the Optimal Price Point (intersection of "too cheap" and "too expensive")
points(x = output.psm$opp,
       y = output.psm$data_vanwestendorp$ecdf_toocheap[which(output.psm$data_vanwestendorp$price == output.psm$opp)],
       cex = 2,
       pch = 17,
       col = "#009E73")

text(x = output.psm$opp,
     y = output.psm$data_vanwestendorp$ecdf_toocheap[which(output.psm$data_vanwestendorp$price == output.psm$opp)],
     labels = paste("OPP:", output.psm$opp),
     pos = 4)

# adding legend
legend("bottomleft",
       title = "Legend",
       c("too cheap", "not cheap", "not expensive", "too expensive"),
       lty = c("dotted", "solid", "solid", "dotted"),
       col = c("#009E73", "#009E73", "#D55E00", "#D55E00"),
       cex = 0.66)

## ---- fig.width=7--------------------------------------------------------
library(ggplot2)

# Plot for Optimal Trial
ggplot(data = output.psm$data_nms, aes(x = price)) + 
  geom_line(aes(y = trial)) + # trial curve
  geom_vline(xintercept = output.psm$price_optimal_trial,
             linetype = "dotted") + # highlighting the optimal price
  geom_text(data = subset(output.psm$data_nms, trial == max(trial)),
            aes(x = price + 0.5, y = trial),
            label = paste("Optimal Price:", output.psm$price_optimal_trial),
            hjust = 0) + # labelling the optimal price
  labs(x = "Price", y = "Likelihood to Buy (Trial)",
       title = "Price Sensitivity Meter: Price for Optimal Trial",
       caption = "Data: Randomly generated") +
  theme_minimal()

# Plot for Optimal Revenue
ggplot(data = output.psm$data_nms, aes(x = price)) + 
    geom_line(aes(y = revenue)) + # revenue curve
  geom_vline(xintercept = output.psm$price_optimal_revenue,
             linetype = "dotted") + # highlighting the optimal price
  geom_text(data = subset(output.psm$data_nms, revenue == max(revenue)),
            aes(x = price + 0.5, y = revenue),
            label = paste("Optimal Price:", output.psm$price_optimal_revenue),
            hjust = 0) + # labelling the optimal price
  labs(x = "Price", y = "Revenue",
       title = "Price Sensitivity Meter: Price for Optimal Revenue",
       caption = paste("Combined revenue for a sample of n =",
                       output.psm$total_sample - output.psm$invalid_cases,
                       "respondents\nData: Randomly generated")) +
  theme_minimal()

## ---- fig.width=7, fig.height=4.5----------------------------------------
par(cex.sub = 0.66) # reducing the font size of the subtitle

# a) Plot for Optimal Trial
# Main plot: Line, axis descriptions
plot(x = output.psm$data_nms$price,
     y = output.psm$data_nms$trial,
     type = "l",
     main = "Price Sensitivity Meter: Price for Optimal Trial",
     xlab = "Price",
     ylab = "Likelihood to Buy (Trial)")

grid() # adding gridlines

# Right-align of subtitle
adj.old <- par()$adj # saving old default value (= centered)
par(adj = 1) # setting the new default to right-align
title(sub = "Data: Randomly generated") # writing the actual subtitle
par(adj = adj.old) # restore standard (so that next main title is again centered)


# drawing additional line to highlight optimal price
abline(v = output.psm$data_nms$price[which.max(output.psm$data_nms$trial)],
       lty = "dotted")

# annotating the optimal price
text(x = output.psm$data_nms$price[which.max(output.psm$data_nms$trial)],
     y = max(output.psm$data_nms$trial),
     labels = paste("Optimal Price:", output.psm$price_optimal_trial),
     pos = 4)

# b) Plot for Optimal Revenue
# Main plot: Line, axis descriptions
plot(x = output.psm$data_nms$price,
     y = output.psm$data_nms$revenue,
     type = "l",
     main = "Price Sensitivity Meter: Price for Optimal Revenue",
     xlab = "Price",
     ylab = "Revenue")

grid() # adding gridlines

# Right-align of subtitle
adj.old <- par()$adj # saving old default value (= centered)
par(adj = 1) # setting the new default to right-align
title(sub = paste("Combined revenue for a sample of n =",
                 output.psm$total_sample - output.psm$invalid_cases,
                 "respondents\nData: Randomly generated")) # writing the actual subtitle
par(adj = adj.old) # restore standard (so that next main title is again centered)

# drawing additional line to highlight optimal price
abline(v = output.psm$data_nms$price[which.max(output.psm$data_nms$revenue)],
       lty = "dotted")

# annotating the optimal price
text(x = output.psm$data_nms$price[which.max(output.psm$data_nms$revenue)],
     y = max(output.psm$data_nms$revenue),
     labels = paste("Optimal Price:", output.psm$price_optimal_revenue),
     pos = 4)

