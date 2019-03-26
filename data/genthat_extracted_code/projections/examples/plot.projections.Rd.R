library(projections)


### Name: plot.projections
### Title: Plot projections objects
### Aliases: plot.projections add_projections

### ** Examples


if (require(outbreaks) &&
    require(distcrete) &&
    require(incidence) &&
    require(magrittr)) {

si <- distcrete("gamma", interval = 1L,
                 shape = 0.37,
                 scale = 41.4, w = 0)

i <- incidence(ebola_sim$linelist$date_of_onset)
plot(i)

## add projections after the first 100 days, over 60 days
set.seed(1)
proj <- project(x = i[1:100], R = 2.1, si = si, n_days = 60)

## plotting projections: different options
plot(proj)
plot(proj, quantiles = c(.025, .5)) # 95% CI
plot(proj, ribbon_color = "red", quantiles = FALSE) # range
plot(proj, ribbon_color = "red", quantiles = FALSE,
     ribbon_quantiles = c(.025, .5))
plot(proj, boxplots = TRUE, quantiles = FALSE, ribbon = FALSE)
plot(proj, boxplots = TRUE, quantiles = FALSE, outliers = FALSE)
plot(proj, linetype = 3)

## adding them to incidence plot
plot(i) %>% add_projections(proj)
plot(i[1:160]) %>% add_projections(proj)
plot(i[1:160]) %>% add_projections(proj, boxplots = FALSE)
plot(i[1:160]) %>%
  add_projections(proj, boxplots_alpha = .3, boxplots_color = "red")

## same, with customised quantiles and colors
quantiles <- c(.001, .01, 0.05, .1, .2, .3, .4, .5)
pal <- colorRampPalette(c("#b3c6ff", "#00e64d", "#cc0066"))
plot(i[1:200]) %>%
  add_projections(proj, quantiles, palette = pal)

}




