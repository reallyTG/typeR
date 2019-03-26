library(ggpol)


### Name: facet_share
### Title: A shared axis for two panels
### Aliases: facet_share

### ** Examples

df <- data.frame(age = sample(1:20, 1000, replace = TRUE), 
                 gender = c("M","F"), levels = c("M", "F"))

# Get the count per age and sex
df$count <- 1
df <- aggregate(count ~ gender + age, data = df, length)

# For the horizontally shared axis, if we want to mirror the axes,
# we have to multiply the first panel by -1, and use coord_flip().
df_h <- df 
df_h$count = ifelse(df_h$gender == "F", df_h$count * -1, df_h$count)

p <- ggplot(df_h, aes(x = factor(age), y = count, fill = gender)) + 
  geom_bar(stat = "identity") +
  facet_share(~gender, dir = "h", scales = "free", reverse_num = TRUE) + 
  coord_flip() +
  labs(x = "Age", y = "Count") + 
  theme(legend.position = "bottom")

p

# When setting direction to vertical, and if we want to mirror the second panel,
# we must multiply the second factor by -1.
# And levels(factor(gender))[2] is M. 
df_v <- df
df_v$count <- ifelse(df_v$gender == "M", df_v$count * -1, df_v$count) 

p <- ggplot(df_v, aes(x = as.factor(age), y = count, fill = gender)) + 
  geom_bar(stat = "identity") +   
  facet_share(~gender, dir = "v", reverse_num = TRUE, 
              scales = "free", strip.position = "left") +
  labs(x = "Age", y = "Count") + 
  theme(legend.position = "left")
p



