library(dendextend)


### Name: colored_bars
### Title: Add colored bars to a dendrogram
### Aliases: colored_bars

### ** Examples



rows_picking <- c(1:5, 25:30)
dend <- (iris[rows_picking,-5]*10) %>% dist %>% hclust %>% as.dendrogram 
odd_numbers <- rows_picking %% 2
cols <- c("gold", "grey")[odd_numbers+1]
# scale is off
plot(dend)
colored_bars(cols, dend)
# move and scale a bit
plot(dend)
colored_bars(cols, dend, y_shift = -1,
             rowLabels = "Odd\n numbers")
# Now let's cut the tree and add that info to the plot:
k2 <- cutree(dend, k = 2)
cols2 <- c("#0082CE", "#CC476B")[k2]
plot(dend)
colored_bars(cbind(cols2, cols), dend, 
            rowLabels = c("2 clusters", "Odd numbers"))

# The same, but with an horizontal plot!
par(mar = c(6,2,2,4))
plot(dend, horiz = TRUE)
colored_bars(cbind(cols2, cols), dend, 
             rowLabels = c("2 clusters", "Odd numbers"),
              horiz = TRUE)



# let's add clusters color
# notice how we need to play with the colors a bit
# this is because color_branches places colors from
# left to right. Which means we need to give colored_bars
# the colors of the items so that ofter sorting they would be
# from left to right. Here is how it can be done:
the_k <- 3
library(colorspace)
cols3 <- rainbow_hcl(the_k, c=90, l=50)
dend %>% set("branches_k_color", k = the_k, with = cols3) %>% plot

kx <- cutree(dend, k = the_k)
ord <- order.dendrogram(dend)
kx  <- sort_levels_values(kx[ord])   
kx  <- kx[match(seq_along(ord), ord)]

par(mar = c(5,5,2,2))
plot(dend)
colored_bars(cbind(cols3[kx], cols2, cols), dend,
             rowLabels = c("3 clusters", "2 clusters", "Odd numbers")) 



## mtcars example

# Create the dend:
dend <- as.dendrogram(hclust(dist(mtcars)))

# Create a vector giving a color for each car to which company it belongs to
car_type <- rep("Other", length(rownames(mtcars)))
is_x <- grepl("Merc", rownames(mtcars))
car_type[is_x] <- "Mercedes"
is_x <- grepl("Mazda", rownames(mtcars))
car_type[is_x] <- "Mazda"
is_x <- grepl("Toyota", rownames(mtcars))
car_type[is_x] <- "Toyota"
car_type <- factor(car_type)
n_car_types <- length(unique(car_type))
col_car_type <- colorspace::rainbow_hcl(n_car_types, c = 70, l  = 50)[car_type]

# extra: showing the various clusters cuts 
k234 <- cutree(dend, k = 2:4)

# color labels by car company:
labels_colors(dend) <- col_car_type[order.dendrogram(dend)]
# color branches based on cutting the tree into 4 clusters:
dend <- color_branches(dend, k = 4)

### plots
par(mar = c(12,4,1,1))
plot(dend)
colored_bars(cbind(k234[,3:1], col_car_type), dend, 
      rowLabels = c(paste0("k = ", 4:2), "Car Type"))

# horiz version:
par(mar = c(4,1,1,12))
plot(dend, horiz = TRUE)
colored_bars(cbind(k234[,3:1], col_car_type), dend, 
      rowLabels = c(paste0("k = ", 4:2), "Car Type"), horiz = TRUE)






