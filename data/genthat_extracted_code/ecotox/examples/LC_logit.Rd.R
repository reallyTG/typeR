library(ecotox)


### Name: LC_logit
### Title: Lethal Concentration Logit
### Aliases: LC_logit

### ** Examples

head(lampreytox)

# within the dataframe used, control dose, unless produced a value
# during experimentation, are removed from the dataframe,
# as glm cannot handle values of infinite. Other statistical programs
# make note of the control dose but do not include within analysis


#calculate LC50 and LC99 for May

m <- LC_logit((response / total) ~ log10(dose), p = c(50, 99),
         weights = total,
         data = lampreytox,
         subset = c(month == "May"))

#view calculated LC50 and LC99 for seasonal toxicity of a pisicide,
#to lamprey in 2011

m

#dose-response curve can be plotted using 'ggplot2'

library(ggplot2)

p1 <- ggplot(data = lampreytox[c(1:19), ],
             aes(x = log10(dose), y = (response / total))) +
  geom_point() +
  geom_smooth(method = "glm",
            method.args = list(family = binomial(link = "logit")),
            aes(weight = total), colour = "#FF0000", se = TRUE)

p1

#calculate LC50s and LC99s for multiple toxicity tests, June, August, and September

j <- LC_logit((response / total) ~ log10(dose), p = c(50, 99),
        weights = total,
        data = lampreytox,
        subset = c(month == "June"))

a <- LC_logit((response / total) ~ log10(dose), p = c(50, 99),
        weights = total,
        data = lampreytox,
        subset = c(month == "August"))

s <- LC_logit((response / total) ~ log10(dose), p = c(50, 99),
        weights = total,
        data = lampreytox,
        subset = c(month == "September"))

#group results together in a dataframe to plot with 'ggplot2'

results <- rbind(m[, c(1, 3:8, 11)], j[,c(1, 3:8, 11)],
                 a[, c(1, 3:8, 11)], s[, c(1, 3:8, 11)])

results$month <- with(results, factor(c("May", "May", "June", "June",
                                        "August", "August", "September",
                                        "September"),
                                        levels = c("May", "June",
                                        "August", "September")))

p2 <- ggplot(data = results, aes(x = month, y = dose,
                             group = factor(p), fill = factor(p))) +
  geom_col(position = position_dodge(width = 0.9), colour = "#000000") +
  geom_errorbar(aes(ymin = (dose - LCL_dis), ymax = (dose + UCL_dis)),
                size = 0.4, width = 0.06,
                position = position_dodge(width = 0.9))

p2



