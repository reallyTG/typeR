library(epiDisplay)


### Name: Follow-up Plot
### Title: Longitudinal followup plot
### Aliases: followup.plot
### Keywords: aplot

### ** Examples

.data <- Indometh
attach(.data)
followup.plot(Subject, time, conc)
followup.plot(Subject, time, conc, lty=1:6, line.col=rep("black",6))
detach(.data)

.data <- Sitka
attach(.data)
followup.plot(tree, Time, size)
followup.plot(tree, Time, size, line.col = "brown")
followup.plot(tree, Time, size, line.col = "multicolor")
followup.plot(tree, Time, size, n.of.lines=20, line.col = "multicolor")

# Breakdown of color by treatment group
followup.plot(tree, Time, size, by=treat)

# The number of lines reduced to 40
followup.plot(tree, Time, size, by=treat, n.of.lines=40)

# Stress some lines
length(table(tree)) # 79 trees followed up

# Identifying trees that sometimes became smaller
.data <- .data[order(.data$tree, .data$Time),]
detach(.data)
attach(.data)
next.tree <- c(tree[-1], NA)
next.size <- c(size[-1], NA)
next.size[tree != next.tree] <- NA
smaller.trees <- tree[next.size < size] 
followup.plot (tree, Time, size, line.col=5, stress=smaller.trees, 
  stress.col=2, stress.width=2, stress.type=2)
followup.plot (tree, Time, size, line.col=5, stress=smaller.trees, 
  stress.col=2, stress.width=2, stress.type=2, stress.labels=TRUE)
detach(.data)
rm(list=ls())  
  



