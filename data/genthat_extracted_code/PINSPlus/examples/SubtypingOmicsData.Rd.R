library(PINSPlus)


### Name: SubtypingOmicsData
### Title: Subtyping multi-omics data
### Aliases: SubtypingOmicsData

### ** Examples

## No test: 
# Load the kidney cancer carcinoma data
data(KIRC)

# Perform subtyping on the multi-omics data
dataList <- list (KIRC$GE, KIRC$ME, KIRC$MI) 
names(dataList) <- c("GE", "ME", "MI")
result <- SubtypingOmicsData(dataList = dataList)

# Change Pertubation clustering algorithm's arguments
result <- SubtypingOmicsData(
    dataList = dataList, 
    clusteringMethod = "kmeans", 
    clusteringOptions = list(nstart = 50)
)

# Plot the Kaplan-Meier curves and calculate Cox p-value
library(survival)
cluster1=result$cluster1;cluster2=result$cluster2
a <- intersect(unique(cluster2), unique(cluster1))
names(a) <- intersect(unique(cluster2), unique(cluster1))
a[setdiff(unique(cluster2), unique(cluster1))] <- seq(setdiff(unique(cluster2), unique(cluster1))) 
                                                  + max(cluster1)
colors <- a[levels(factor(cluster2))]
coxFit <- coxph(
 Surv(time = Survival, event = Death) ~ as.factor(cluster2),
 data = KIRC$survival,
 ties = "exact"
)
mfit <- survfit(Surv(Survival, Death == 1) ~ as.factor(cluster2), data = KIRC$survival)
plot(
 mfit, col = colors,
 main = "Survival curves for KIRC, level 2",
 xlab = "Days", ylab = "Survival",lwd = 2
)
legend("bottomright", 
    legend = paste(
        "Cox p-value:", 
        round(summary(coxFit)$sctest[3], digits = 5), 
        sep = ""
    )
)
legend(
    "bottomleft",
    fill = colors,
    legend = paste(
        "Group ",
        levels(factor(cluster2)),": ", table(cluster2)[levels(factor(cluster2))], 
        sep =""
    )
)

## End(No test)



