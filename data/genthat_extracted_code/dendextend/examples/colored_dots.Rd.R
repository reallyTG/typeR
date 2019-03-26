library(dendextend)


### Name: colored_dots
### Title: Add colored dots beside a dendrogram
### Aliases: colored_dots

### ** Examples


rows_picking <- c(1:5, 25:30)
dend <- (iris[rows_picking,-5]*10) %>% dist %>% hclust %>% as.dendrogram
odd_numbers <- rows_picking %% 2
cols <- c("red", "white")[odd_numbers+1]
plot(dend)
colored_dots(cols, dend)
# Example of adjusting postion of dots
plot(dend)
colored_dots(cols, dend, y_shift = -1,
             rowLabels = "Odd\n numbers")
rows_picking <- c(1:5, 25:30)
dend <- (iris[rows_picking,-5]*10) %>% dist %>% hclust %>% as.dendrogram
odd_numbers <- rows_picking %% 2
# For leaves that shouldn't have dots, make them the same color as the background,
# or set the alpha value to fully transparant
cols <- c("black", "white")[odd_numbers+1]
# scale is off
plot(dend)
colored_dots(cols, dend)
# move and scale a bit
plot(dend)
colored_dots(cols, dend, y_shift = -1,
             rowLabels = "Odd\n numbers")
# Now let's cut the tree and add that info to the plot:
k2 <- cutree(dend, k = 2)
cols2 <- c("#1b9e77", "#d95f02")[k2]

par(mar = c(5,6,1,1))
plot(dend)
colored_dots(cbind(cols2, cols), dend,
             rowLabels = c("2 clusters", "Even numbers"))

# The same, but with an horizontal plot!
par(mar = c(6,2,2,4))
plot(dend, horiz = TRUE)
colored_dots(cbind(cols2, cols), dend,
             rowLabels = c("2 clusters", "Even numbers"),
             horiz = TRUE)

#==============================
#==============================

## mtcars example

# Create the dend:
dend <- as.dendrogram(hclust(dist(mtcars)))

# Get all company names
comp_names <- unlist(lapply(rownames(mtcars), function(x) strsplit(x," ")[[1]][[1]]))
# Get the top three occurring companies
top_three <- sort(table(comp_names),decreasing = TRUE)[1:3]
# Match the top three companies to where they are found in the dendrogram labels
top_three <- sapply(names(top_three), function(x) grepl(x, labels(dend)))
top_three <- as.data.frame(top_three)
# "top_three" is now a data frame of the top three companies as columns.
# Each column represents a vector (rows) which is the length of labels(dend).
# The vector has values TRUE and FALSE, for whether the company name matched
# labels(dend)[i]

# Colorblind friendly vector of HEX colors
colorblind_friendly <- c("#1b9e77", "#d95f02", "#7570b3")

# If we run the for-loop on "top_three" we will turn the vectors into a character-type too early,
# so make a copy to "colored_dataframe" which we will work on
colored_dataframe <- top_three

for (i in 1:3){
   # This replaces TRUE values with a color from our vector of colors
   colored_dataframe[top_three[,i],i] <- colorblind_friendly[[i]]
   # This replaces FALSE values with black HEX, but fully transparent (invisible on plot)
   colored_dataframe[!top_three[,i],i] <- "#00000000"
}

# Color branches and labels by "cutting" the dendrogram at an arbitrary height
dend <- color_branches(dend, h = 170)
dend <- color_labels(dend, h = 170)

### plots
par(mar = c(12,4,1,1))
plot(dend)
colored_dots(colored_dataframe, dend,
             rowLabels = colnames(colored_dataframe), horiz = FALSE, sort_by_labels_order = FALSE)
# Show a dotted line where tree was "cut"
abline(h=170,lty=3)

# horiz version:
par(mar = c(4,1,1,12))
plot(dend, horiz = TRUE)
colored_dots(colored_dataframe, dend,
            rowLabels = colnames(colored_dataframe), horiz = TRUE, sort_by_labels_order = FALSE)
# Show a dotted line where the tree was "cut"
abline(v=170,lty=3)



