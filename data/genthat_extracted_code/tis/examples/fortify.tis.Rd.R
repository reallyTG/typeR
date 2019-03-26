library(tis)


### Name: fortify.tis
### Title: Fortify a tis object
### Aliases: fortify.tis

### ** Examples

    if(require("ggplot2") && require("reshape")) {
             # Examples of plotting tis series with ggplot2
             require("datasets")
             require("scales")

             # univariate example
             num_discoveries <- as.tis(discoveries)
             ggplot(data = fortify(num_discoveries, offset=0)) + 
                    geom_line(aes(x=date, y=num_discoveries)) + 
                    scale_x_date(breaks = date_breaks("10 years"), labels = date_format("%Y"))
             
             # multivariate example using the "melt trick"
             Seatbelts.tis <- as.tis(Seatbelts[ , c("drivers", "front", "rear")])
             Seatbelt.names <- c("Driver", "Front Seat Passenger", "Back Seat Passenger")
             Seatbelts.df <- fortify(Seatbelts.tis, dfNames = Seatbelt.names,
                                     timeName = "Time")
             Seatbelts.dfm <- melt(Seatbelts.df, id.var = "Time", variable_name="type")
             qplot( Time, value, data = Seatbelts.dfm, geom="line", 
                    group=type, colour=type, linetype=type ) + 
                 geom_vline(xintercept=as.numeric(as.Date("1983-01-31")), 
                    colour="black", linetype="dashed") +
                 ylab("Monthly Road Casulties in the UK")
    }



