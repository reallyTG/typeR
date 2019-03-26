library(VGAMdata)


### Name: wffc
### Title: 2008 World Fly Fishing Championships Data
### Aliases: wffc
### Keywords: datasets

### ** Examples

summary(wffc)
with(wffc, table(water, session))

# Obtain some simple plots
waihou <- subset(wffc, water == "Waihou")
waimak <- subset(wffc, water == "Waimakariri")
whang  <- subset(wffc, water == "Whanganui")
otam   <- subset(wffc, water == "Otamangakau")
roto   <- subset(wffc, water == "Rotoaira")
minlength <- min(wffc[, "length"])
maxlength <- max(wffc[, "length"])
nwater <- c("Waihou"    = nrow(waihou), "Waimakariri" = nrow(waimak),
            "Whanganui" = nrow(whang),  "Otamangakau" = nrow(otam),
            "Rotoaira"  = nrow(roto))
## Not run: 
##D par(mfrow = c(2, 3), las = 1)
##D # Overall distribution of length
##D with(wffc, boxplot(length/10 ~ water, ylim = c(minlength, maxlength)/10,
##D                    border = "blue", main = "Length (cm)", cex.axis = 0.5))
##D 
##D # Overall distribution of LOG length
##D with(wffc, boxplot(length/10 ~ water, ylim = c(minlength, maxlength)/10,
##D                    border = "blue", log = "y", cex.axis = 0.5,
##D                    main = "Length (cm) on a log scale"))
##D 
##D # Overall distribution of number of captures
##D pie(nwater, border = "blue", main = "Proportion of captures",
##D     labels = names(nwater), density = 10, col = 1:length(nwater),
##D     angle = 85+30* 1:length(nwater))
##D 
##D # Overall distribution of number of captures
##D with(wffc, barplot(nwater, main = "Number of captures", cex.names = 0.5,
##D                    col = "lightblue"))
##D 
##D # Overall distribution of proportion of number of captures
##D with(wffc, barplot(nwater / sum(nwater), cex.names = 0.5, col = "lightblue",
##D                    main = "Proportion of captures"))
##D # An interesting lake
##D with(roto, hist(length/10, xlab = "Fish length (cm)", col = "lightblue",
##D                 breaks = seq(18, 70, by = 3), prob = TRUE, ylim = c(0, 0.08),
##D                 border = "blue", ylab = "", main = "Lake Rotoaira", lwd = 2))
## End(Not run)



