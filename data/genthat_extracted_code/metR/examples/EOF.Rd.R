library(metR)


### Name: EOF
### Title: Empirical Orthogonal Function
### Aliases: EOF

### ** Examples

# The Antarctic Oscillation is computed from the
# monthly geopotential height anomalies weigthed by latitude.
library(data.table)
data(geopotential)
geopotential <- copy(geopotential)
geopotential[, gh.t.w := Anomaly(gh)*sqrt(cos(lat*pi/180)),
      by = .(lon, lat, month(date))]

eof <- EOF(gh.t.w ~ lat + lon | date, 1:5, data = geopotential,
           B = 100, probs = c(low = 0.1, hig = 0.9))

# Inspect the explained variance of each component
summary(eof)
screeplot(eof)

# Keep only the 1st.
aao <- cut(eof, 1)

# AAO field
library(ggplot2)
ggplot(aao$left, aes(lon, lat, z = gh.t.w)) +
    geom_contour(aes(color = ..level..)) +
    coord_polar()

# AAO signal
ggplot(aao$right, aes(date, gh.t.w)) +
    geom_line()

# standard deviation, % of explained variance and
# confidence intervals.
aao$sdev

# Reconstructed fields based only on the two first
# principal components
field <- predict(eof, 1:2)

# Compare it to the real field.
ggplot(field[date == date[1]], aes(lon, lat)) +
    geom_contour_fill(aes(z = gh.t.w), data = geopotential[date == date[1]]) +
    geom_contour2(aes(z = gh.t.w, linetype = factor(-sign(stat(level))))) +
    scale_fill_divergent()





