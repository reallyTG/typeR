library(EngrExpt)


### Name: battery
### Title: Battery lifetime in laptop computers
### Aliases: battery
### Keywords: datasets

### ** Examples

str(battery)
densityplot(~ lifetime, battery, groups = type,
            xlab = "Battery lifetime (hours)",
            auto.key = list(columns = 3, lines = TRUE))
densityplot(~ lifetime, battery, groups = type,
            scales = list(x = list(log = 2)),
            xlab = "Battery lifetime (hours) - logarithmic scale",
            auto.key = list(columns = 3, lines = TRUE))
dotplot(reorder(as.factor(type), lifetime) ~ lifetime, battery,
        jitter.y = TRUE,
        xlab = "Battery lifetime (hours)",
        ylab = "Type", type = c("p", "a"))
dotplot(reorder(as.factor(type), lifetime) ~ lifetime, battery,
        jitter.y = TRUE, scales = list(x = list(log = 2)),
        xlab = "Battery lifetime (hours) - logarithmic scale",
        ylab = "Type", type = c("p", "a"))



