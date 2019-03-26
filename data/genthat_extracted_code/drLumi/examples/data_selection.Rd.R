library(drLumi)


### Name: data_selection
### Title: Extracts samples information from a lum_export object or
###   data.frame
### Aliases: data_selection

### ** Examples

# Load data
data(ecdata)
data(mfidata)

dat <- subset(mfidata,plate=="plate_1" & analyte=="FGF")

# Example 1
sdf <- data_selection(dat)

lapply(sdf$plate_1, function(x) head(x))

# Example 2 (merge ecdata)
sdf <- data_selection(dat, ecfile = ecdata,
             byvar.ecfile=c("analyte","sample"))

lapply(sdf$plate_1, function(x) head(x))

# Example 3 (extract specific samples names with list)
sdf <- data_selection(dat,
             stanname=list("Standard10"),
             backname = list("Background0"),
             posname = list("Control1","Control2"),
             unkname = list("B_sid_13_CSP"))

lapply(sdf$plate_1, function(x) head(x))

# Example 4 (extract aproximate names samples)
sdf <- data_selection(dat,
             stanname="Standard1",
             backname = "Background0",
             posname = "Control1",
             unkname = "B_sid_13_CSP")

lapply(sdf$plate_1, function(x) (x))



