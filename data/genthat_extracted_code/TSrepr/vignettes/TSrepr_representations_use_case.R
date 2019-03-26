## ---- message=F----------------------------------------------------------
library(TSrepr)
library(ggplot2)
library(data.table)

data("elec_load")
dim(elec_load)

## ------------------------------------------------------------------------
data_seasprof <- repr_matrix(elec_load, func = repr_seas_profile,
                             args = list(freq = 48, func = mean),
                             normalise = TRUE, func_norm = norm_z)
dim(data_seasprof)

## ------------------------------------------------------------------------
res_km <- kmeans(data_seasprof, 5, nstart = 10)

## ---- warning=F, message=F, fig.height=5.5, fig.width=7------------------
# prepare data for plotting
data_plot <- data.table(melt(data.table(class = as.factor(res_km$cluster), data_seasprof)))
data_plot[, Time := rep(1:ncol(data_seasprof), each = nrow(data_seasprof))]
data_plot[, ID := rep(1:nrow(data_seasprof), ncol(data_seasprof))]

# prepare centroids
centers <- data.table(melt(res_km$centers))
setnames(centers, c("Var1", "Var2"), c("class", "Time"))
centers[, ID := class]

# plot the results
ggplot(data_plot, aes(Time, value, group = ID)) +
  facet_wrap(~class, ncol = 2, scales = "free_y") +
  geom_line(color = "grey10", alpha = 0.65) +
  geom_line(data = centers, aes(Time, value), color = "firebrick1", alpha = 0.80, size = 1.2) +
  labs(x = "Time", y = "Load (normalised)") +
  theme_bw()

## ------------------------------------------------------------------------
data_gam <- repr_matrix(elec_load, func = repr_gam, args = list(freq = c(48, 48*7)),
                        normalise = TRUE, func_norm = norm_z)
dim(data_gam)

## ------------------------------------------------------------------------
res_km <- kmeans(data_gam, 5, nstart = 10)

## ---- warning=F, message=F, fig.height=5.5, fig.width=7------------------
# prepare data for plotting
data_plot <- data.table(melt(data.table(class = as.factor(res_km$cluster), data_gam)))
data_plot[, Time := rep(1:ncol(data_gam), each = nrow(data_gam))]
data_plot[, ID := rep(1:nrow(data_gam), ncol(data_gam))]

# prepare centroids
centers <- data.table(melt(res_km$centers))
setnames(centers, c("Var1", "Var2"), c("class", "Time"))
centers[, ID := class]

# plot the results
ggplot(data_plot, aes(Time, value, group = ID)) +
  facet_wrap(~class, ncol = 2, scales = "free_y") +
  geom_line(color = "grey10", alpha = 0.65) +
  geom_line(data = centers, aes(Time, value), color = "firebrick1", alpha = 0.80, size = 1.2) +
  geom_vline(xintercept = 46, color = "dodgerblue2", size = 1.4, linetype = 5, alpha = 0.8) +
  labs(x = "Time", y = "Load (normalised)") +
  theme_bw()

## ------------------------------------------------------------------------
data_dft <- repr_matrix(elec_load, func = repr_dft, args = list(coef = 48),
                        normalise = TRUE, func_norm = norm_z)
dim(data_dft)

## ------------------------------------------------------------------------
res_km <- kmeans(data_dft, 5, nstart = 10)

## ---- warning=F, message=F, fig.height=5.5, fig.width=7------------------
# prepare data for plotting
data_plot <- data.table(melt(data.table(class = as.factor(res_km$cluster), data_dft)))
data_plot[, Time := rep(1:ncol(data_dft), each = nrow(data_dft))]
data_plot[, ID := rep(1:nrow(data_dft), ncol(data_dft))]

# prepare centroids
centers <- data.table(melt(res_km$centers))
setnames(centers, c("Var1", "Var2"), c("class", "Time"))
centers[, ID := class]

# plot the results
ggplot(data_plot, aes(Time, value, group = ID)) +
  facet_wrap(~class, ncol = 2, scales = "free_y") +
  geom_line(color = "grey10", alpha = 0.65) +
  geom_line(data = centers, aes(Time, value), color = "firebrick1", alpha = 0.80, size = 1.2) +
  labs(x = "Time", y = "Load (normalised)") +
  theme_bw()

## ------------------------------------------------------------------------
data_feaclip <- repr_matrix(elec_load, func = repr_feaclip, windowing = TRUE, win_size = 48)
dim(data_feaclip)

## ------------------------------------------------------------------------
res_km <- kmeans(data_feaclip, 5, nstart = 10)

## ---- warning=F, message=F, fig.height=5.5, fig.width=7------------------
# prepare data for plotting
data_plot <- data.table(melt(data.table(class = as.factor(res_km$cluster), data_feaclip)))
data_plot[, Time := rep(1:ncol(data_feaclip), each = nrow(data_feaclip))]
data_plot[, ID := rep(1:nrow(data_feaclip), ncol(data_feaclip))]

# prepare centroids
centers <- data.table(melt(res_km$centers))
setnames(centers, c("Var1", "Var2"), c("class", "Time"))
centers[, ID := class]

# plot the results
ggplot(data_plot, aes(Time, value, group = ID)) +
  facet_wrap(~class, ncol = 2, scales = "free_y") +
  geom_line(color = "grey10", alpha = 0.65) +
  geom_line(data = centers, aes(Time, value), color = "firebrick1", alpha = 0.80, size = 1.2) +
  labs(x = "Time", y = "Load (normalised)") +
  theme_bw()

