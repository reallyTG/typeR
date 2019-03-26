library(contextual)


### Name: Plot
### Title: Plot
### Aliases: Plot average optimal arms do_plot gg_color_hue
###   check_history_data

### ** Examples

## Not run: 
##D 
##D bandit <- ContextualPrecachingBandit$new(weights = c(0.9, 0.1, 0.1))
##D 
##D agents <- list(Agent$new(RandomPolicy$new(), bandit),
##D                Agent$new(OraclePolicy$new(), bandit),
##D                Agent$new(ThompsonSamplingPolicy$new(1.0, 1.0), bandit),
##D                Agent$new(Exp3Policy$new(0.1), bandit),
##D                Agent$new(GittinsBrezziLaiPolicy$new(), bandit),
##D                Agent$new(UCB1Policy$new(), bandit))
##D 
##D history <- Simulator$new(agents, horizon = 100, simulations = 1000)$run()
##D 
##D par(mfrow = c(3, 2), mar = c(1, 4, 2, 1), cex=1.3)
##D 
##D plot(history, type = "cumulative", use_colors = FALSE, no_par = TRUE, legend_border = FALSE,
##D      limit_agents = c("GittinsBrezziLai", "UCB1","ThompsonSampling"))
##D 
##D plot(history, type = "cumulative", regret = FALSE, legend = FALSE,
##D      limit_agents = c("UCB1"), traces = TRUE, no_par = TRUE)
##D 
##D plot(history, type = "cumulative", regret = FALSE, rate = TRUE, disp = "sd",
##D      limit_agents = c("Exp3", "ThompsonSampling"),
##D      legend_position = "bottomright", no_par = TRUE)
##D 
##D plot(history, type = "cumulative", rate = TRUE, plot_only_disp = TRUE,
##D      disp = "var", smooth = TRUE, limit_agents = c("UCB1", "GittinsBrezziLai"),
##D     legend_position = "bottomleft", no_par = TRUE)
##D 
##D plot(history, type = "average", disp = "ci", regret = FALSE, interval = 10,
##D      smooth = TRUE, legend_position = "bottomright", no_par = TRUE, legend = FALSE)
##D 
##D plot(history, limit_agents = c("ThompsonSampling"), type = "arms",
##D      interval = 20, no_par = TRUE)
##D 
## End(Not run)





