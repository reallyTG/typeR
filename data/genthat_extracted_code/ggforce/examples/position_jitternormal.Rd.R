library(ggforce)


### Name: position_jitternormal
### Title: Jitter points with normally distributed random noise
### Aliases: position_jitternormal

### ** Examples

# Example data
df <- data.frame(
  x = sample(1:3, 1500, TRUE),
  y = sample(1:3, 1500, TRUE)
)

# position_jitter results in rectangular clusters
ggplot(df, aes(x = x, y = y)) +
  geom_point(position = position_jitter())

# geom_jitternormal results in more circular clusters
ggplot(df, aes(x = x, y = y)) +
  geom_point(position = position_jitternormal())

# You can adjust the standard deviations along both axes
# Tighter circles
ggplot(df, aes(x = x, y = y)) +
  geom_point(position = position_jitternormal(sd_x = 0.08, sd_y = 0.08))

# Oblong shapes
ggplot(df, aes(x = x, y = y)) +
  geom_point(position = position_jitternormal(sd_x = 0.2, sd_y = 0.08))

# Only add random noise to one dimension
ggplot(df, aes(x = x, y = y)) +
  geom_point(
    position = position_jitternormal(sd_x = 0.15, sd_y = 0),
    alpha = 0.1
  )



