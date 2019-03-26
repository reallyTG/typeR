library(HistData)


### Name: Nightingale
### Title: Florence Nightingale's data on deaths from various causes in the
###   Crimean War
### Aliases: Nightingale
### Keywords: datasets

### ** Examples

data(Nightingale)

# For some graphs, it is more convenient to reshape death rates to long format
#  keep only Date and death rates
require(reshape)
Night<- Nightingale[,c(1,8:10)]
melted <- melt(Night, "Date")
names(melted) <- c("Date", "Cause", "Deaths")
melted$Cause <- sub("\\.rate", "", melted$Cause)
melted$Regime <- ordered( rep(c(rep('Before', 12), rep('After', 12)), 3), 
                          levels=c('Before', 'After'))
Night <- melted

# subsets, to facilitate separate plotting
Night1 <- subset(Night, Date < as.Date("1855-04-01"))
Night2 <- subset(Night, Date >= as.Date("1855-04-01"))

# sort according to Deaths in decreasing order, so counts are not obscured [thx: Monique Graf]
Night1 <- Night1[order(Night1$Deaths, decreasing=TRUE),]
Night2 <- Night2[order(Night2$Deaths, decreasing=TRUE),]

# merge the two sorted files
Night <- rbind(Night1, Night2)


require(ggplot2)
# Before plot
cxc1 <- ggplot(Night1, aes(x = factor(Date), y=Deaths, fill = Cause)) +
		# do it as a stacked bar chart first
   geom_bar(width = 1, position="identity", stat="identity", color="black") +
		# set scale so area ~ Deaths	
   scale_y_sqrt() 
		# A coxcomb plot = bar chart + polar coordinates
cxc1 + coord_polar(start=3*pi/2) + 
	ggtitle("Causes of Mortality in the Army in the East") + 
	xlab("")

# After plot
cxc2 <- ggplot(Night2, aes(x = factor(Date), y=Deaths, fill = Cause)) +
   geom_bar(width = 1, position="identity", stat="identity", color="black") +
   scale_y_sqrt()
cxc2 + coord_polar(start=3*pi/2) +
	ggtitle("Causes of Mortality in the Army in the East") + 
	xlab("")

## Not run: 
##D # do both together, with faceting
##D cxc <- ggplot(Night, aes(x = factor(Date), y=Deaths, fill = Cause)) +
##D  geom_bar(width = 1, position="identity", stat="identity", color="black") + 
##D  scale_y_sqrt() +
##D  facet_grid(. ~ Regime, scales="free", labeller=label_both)
##D cxc + coord_polar(start=3*pi/2) +
##D 	ggtitle("Causes of Mortality in the Army in the East") + 
##D 	xlab("")
## End(Not run)

## What if she had made a set of line graphs?

# these plots are best viewed with width ~ 2 * height 
colors <- c("blue", "red", "black")
with(Nightingale, {
	plot(Date, Disease.rate, type="n", cex.lab=1.25, 
		ylab="Annual Death Rate", xlab="Date", xaxt="n",
		main="Causes of Mortality of the British Army in the East");
	# background, to separate before, after
	rect(as.Date("1854/4/1"), -10, as.Date("1855/3/1"), 
		1.02*max(Disease.rate), col=gray(.90), border="transparent");
	text( as.Date("1854/4/1"), .98*max(Disease.rate), "Before Sanitary\nCommission", pos=4);
	text( as.Date("1855/4/1"), .98*max(Disease.rate), "After Sanitary\nCommission", pos=4);
	# plot the data
	points(Date, Disease.rate, type="b", col=colors[1], lwd=3);
	points(Date, Wounds.rate, type="b", col=colors[2], lwd=2);
	points(Date, Other.rate, type="b", col=colors[3], lwd=2)
	}
)
# add custom Date axis and legend
axis.Date(1, at=seq(as.Date("1854/4/1"), as.Date("1856/3/1"), "3 months"), format="%b %Y")
legend(as.Date("1855/10/20"), 700, c("Preventable disease", "Wounds and injuries", "Other"),
	col=colors, fill=colors, title="Cause", cex=1.25)

# Alternatively, show each cause of death as percent of total
Nightingale <- within(Nightingale, {
	Total <- Disease + Wounds + Other
	Disease.pct <- 100*Disease/Total
	Wounds.pct <- 100*Wounds/Total
	Other.pct <- 100*Other/Total
	})

colors <- c("blue", "red", "black")
with(Nightingale, {
	plot(Date, Disease.pct, type="n",  ylim=c(0,100), cex.lab=1.25,
		ylab="Percent deaths", xlab="Date", xaxt="n",
		main="Percentage of Deaths by Cause");
	# background, to separate before, after
	rect(as.Date("1854/4/1"), -10, as.Date("1855/3/1"), 
		1.02*max(Disease.rate), col=gray(.90), border="transparent");
	text( as.Date("1854/4/1"), .98*max(Disease.pct), "Before Sanitary\nCommission", pos=4);
	text( as.Date("1855/4/1"), .98*max(Disease.pct), "After Sanitary\nCommission", pos=4);
	# plot the data
	points(Date, Disease.pct, type="b", col=colors[1], lwd=3);
	points(Date, Wounds.pct, type="b", col=colors[2], lwd=2);
	points(Date, Other.pct, type="b", col=colors[3], lwd=2)
	}
)
# add custom Date axis and legend
axis.Date(1, at=seq(as.Date("1854/4/1"), as.Date("1856/3/1"), "3 months"), format="%b %Y")
legend(as.Date("1854/8/20"), 60, c("Preventable disease", "Wounds and injuries", "Other"),
	col=colors, fill=colors, title="Cause", cex=1.25)




