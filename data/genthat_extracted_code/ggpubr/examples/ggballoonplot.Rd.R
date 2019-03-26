library(ggpubr)


### Name: ggballoonplot
### Title: Ballon plot
### Aliases: ggballoonplot

### ** Examples

# Define color palette
my_cols <- c("#0D0887FF", "#6A00A8FF", "#B12A90FF",
"#E16462FF", "#FCA636FF", "#F0F921FF")

# Standard contingency table
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# Read a contingency table: housetasks
# Repartition of 13 housetasks in the couple
data <- read.delim(
  system.file("demo-data/housetasks.txt", package = "ggpubr"),
  row.names = 1
  )
data

# Basic ballon plot
ggballoonplot(data)

# Change color and fill
ggballoonplot(data, color = "#0073C2FF", fill = "#0073C2FF")


# Change color according to the value of table cells
ggballoonplot(data, fill = "value")+
   scale_fill_gradientn(colors = my_cols)

# Change the plotting symbol shape
ggballoonplot(data, fill = "value",  shape = 23)+
  gradient_fill(c("blue", "white", "red"))


# Set points size to 8, but change fill color by values
# Sow labels
ggballoonplot(data, fill = "value", color = "lightgray",
              size = 10, show.label = TRUE)+
  gradient_fill(c("blue", "white", "red"))

# Streched contingency table
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Create an Example Data Frame Containing Car x Color data
carnames <- c("bmw","renault","mercedes","seat")
carcolors <- c("red","white","silver","green")
datavals <- round(rnorm(16, mean=100, sd=60),1)
car_data <- data.frame(Car = rep(carnames,4),
                   Color = rep(carcolors, c(4,4,4,4) ),
                   Value=datavals )

car_data

ggballoonplot(car_data, x = "Car", y = "Color",
              size = "Value", fill = "Value") +
   scale_fill_gradientn(colors = my_cols) +
  guides(size = FALSE)


# Grouped frequency table
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::
data("Titanic")
dframe <- as.data.frame(Titanic)
head(dframe)
ggballoonplot(
 dframe, x = "Class", y = "Sex",
 size = "Freq", fill = "Freq",
 facet.by = c("Survived", "Age"),
 ggtheme = theme_bw()
)+
  scale_fill_gradientn(colors = my_cols)

# Hair and Eye Color of Statistics Students
data(HairEyeColor)
ggballoonplot( as.data.frame(HairEyeColor),
              x = "Hair", y = "Eye", size = "Freq",
              ggtheme = theme_gray()) %>%
 facet("Sex")





