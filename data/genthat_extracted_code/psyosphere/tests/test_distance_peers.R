
# Print title
cat("\nTesting distance_peers()\n")

# Get data
rm(list = ls(all.names = TRUE))
data(psyo_rounds2)

# Test matching time ----------------------------------------------------------

# Get data
time <- as.POSIXct("2015-09-03 13:51:07")
tracks <- psyo_rounds2[ psyo_rounds2[,"time"] == time, ]

# Calculation
tracks <- distance_peers(tracks)

# Check results
dis1 <- unlist(distance_point(tracks[c(2,3),], tracks[1,])["dis_to_point_in_m"])
dis2 <- unlist(distance_point(tracks[c(1,3),], tracks[2,])["dis_to_point_in_m"])
dis3 <- unlist(distance_point(tracks[c(1,2),], tracks[3,])["dis_to_point_in_m"])

if (mean(dis1) != tracks[1,"average_dis"]) {stop("Wrong distance")}
if (mean(dis2) != tracks[2,"average_dis"]) {stop("Wrong distance")}
if (mean(dis3) != tracks[3,"average_dis"]) {stop("Wrong distance")}

rm(tracks, time, dis1, dis2, dis3)

# Test with specefied peers ----------------------------------------------------

# Get data
tracks <- psyo_rounds2
time_min <- tracks[11, "time"]
time_max <- tracks[13, "time"]
tracks <- tracks[ tracks[,"time"] >= time_min & tracks[,"time"] <= time_max ,]

# Calcualtion
tracks[ tracks[,"id"] == "17.gpx_1", "team"] <- 1
tracks <- distance_peers(tracks, cpeer = "team")

# Check results
if (sum(is.na(tracks[,"average_dis"])) != 6) {stop("Wrong test sum")}
if (round(sum(tracks[,"average_dis"], na.rm = TRUE),0) != 36) {
  stop("Wrong test sum")
}
rm(tracks, time_min, time_max)

# Test when no peers -----------------------------------------------------------

# Get data
t_id <- psyo_rounds2[1,"id"]
tracks <- psyo_rounds2[ psyo_rounds2[,"id"] == t_id, ]

# Calculation
tracks <- distance_peers(tracks)

# Check results
if (sum(is.na(tracks[,"average_dis"])) != 98) {stop("Wrong test sum")}
rm(tracks, t_id)

# Test when peers don't have matching coordinates ------------------------------

# Get data
tracks <- select_test_sample(psyo_rounds2, size = 1)
tracks <- tracks[ tracks[,"track"] == 1 ,]

# Calculation
tracks <- distance_peers(tracks)

# Check results
if (NROW(tracks) != 3) { stop("Wrong number of observations") }
if (NCOL(tracks) != 11) { stop("Wrong number of variables") }
if ( sum( is.na( tracks[,"average_dis"] ) ) != 3 ) {stop("Wrong test_sum")}
rm(tracks)

# Test intersect position ------------------------------------------------------

#  p1 --------x-------> p2
#             ^
#             |
#             |
#            p3

# We have two tracks. From track 1 we have p1 and p2 at a certain time. From
# tracks 2 we have point 3. Point 3 has a time between p1 and p2. We want to
# know what the distance from point 3 is to track 1 at the time of point 3. For
# this we need to determine point x.

# Create the points

p1 <- data.frame(time = "2016-01-01 01:00:00", lon = 0, lat = 0, id = "1")
p2 <- data.frame(time = "2016-01-01 03:00:00", lon = 2, lat = 0, id = "1")
p3 <- data.frame(time = "2016-01-01 02:00:00", lon = 1, lat = 1, id = "2")
p1$time <- as.POSIXct(p1$time)
p2$time <- as.POSIXct(p2$time)
p3$time <- as.POSIXct(p3$time)

# Combine into a track
tracks <- rbind(p1, p2, p3)

# Get point x
x <- psyosphere:::timed_destination_point_private(p1, p2, p3, "id")

# Plot points as tracks for illustration
# plot <- plot_tracks(tracks)
# plot

# Add x to plot for illustration
# plot_tracks(x, plot = plot)
# rm(plot)

# Get distances
tracks <- distance_peers(tracks)

# Check results
dis <- distance_point(tracks = p3, point = x, drop = FALSE, cname = "d")["d"]
if (tracks[3,"average_dis"] != dis["d"]) {stop("Wrong distance")}

rm(p1, p2, p3, tracks, x, dis)

# Test for correct order of results --------------------------------------------

# Get data
tracks <- psyo_rounds2[c(1,25,50,100),]
tracks[,"time"] <- tracks[1,"time"]
tracks[,"id"] <- 1:4
tracks[c(1,3),"team"] <- 1
tracks[c(2,4),"team"] <- 2

# Calculation
tracks <- distance_peers(tracks, cpeer = "team")

p1 <- tracks[ tracks[,"team"] == 1, "average_dis"][1]
p2 <- tracks[ tracks[,"team"] == 1, "average_dis"][2]
p3 <- tracks[ tracks[,"team"] == 2, "average_dis"][1]
p4 <- tracks[ tracks[,"team"] == 2, "average_dis"][2]

if (p1 != p2 | p3 != p4) stop("Distance order is incorrect")
