library(dotwhisker)


### Name: small_multiple
### Title: Generate a 'Small Multiple' Plot of Regression Results
### Aliases: small_multiple

### ** Examples

library(broom)
library(dplyr)

# Generate a tidy data frame of regression results from six models

m <- list()
ordered_vars <- c("wt", "cyl", "disp", "hp", "gear", "am")
m[[1]] <- lm(mpg ~ wt, data = mtcars)
m123456_df <- m[[1]] %>% tidy %>% by_2sd(mtcars) %>%
  mutate(model = "Model 1")

for (i in 2:6) {
 m[[i]] <- update(m[[i-1]], paste(". ~ . +", ordered_vars[i]))
 m123456_df <- rbind(m123456_df, m[[i]] %>% tidy %>% by_2sd(mtcars) %>%
   mutate(model = paste("Model", i)))
}

# Generate a 'small multiple' plot
small_multiple(m123456_df)


## Using submodels to compare results across different samples
# Generate a tidy data frame of regression results from five models on
# the mtcars data subset by transmission type (am)
ordered_vars <- c("wt", "cyl", "disp", "hp", "gear")
mod <- "mpg ~ wt"
by_trans <- mtcars %>% group_by(am) %>%  # group data by transmission
  do(tidy(lm(mod, data = .))) %>%        # run model on each group
  rename(submodel = am) %>%              # make submodel variable
  mutate(model = "Model 1") %>%          # make model variable
 ungroup()

for (i in 2:5) {
   mod <- paste(mod, "+", ordered_vars[i])
   by_trans <- rbind(by_trans, mtcars %>% group_by(am) %>%
                         do(tidy(lm(mod, data = .))) %>%
                         rename(submodel = am) %>%
                         mutate(model = paste("Model", i)) %>%
                         ungroup())
}

small_multiple(by_trans) +
theme_bw() + ylab("Coefficient Estimate") +
    geom_hline(yintercept = 0, colour = "grey60", linetype = 2) +
    theme(axis.text.x  = element_text(angle = 45, hjust = 1),
          legend.position=c(0, 0), legend.justification=c(0, 0),
          legend.title = element_text(size=9),
          legend.background = element_rect(color="gray90"),
          legend.spacing = unit(-3, "pt"),
          legend.key.size = unit(10, "pt")) +
    scale_colour_hue(name = "Transmission",
    breaks = c(0, 1),
    labels = c("Automatic", "Manual"))




