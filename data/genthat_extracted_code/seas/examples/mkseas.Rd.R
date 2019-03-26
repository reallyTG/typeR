library(seas)


### Name: mkseas
### Title: Make a date into a seasonal factor
### Aliases: mkseas
### Keywords: utilities datagen ts

### ** Examples

# Demonstrate the number of days in each category
ylab <- "Number of days"

barplot(table(mkseas(width="mon", year=2005)),
        main="Number of days in each month",
        ylab=ylab)

barplot(table(mkseas(width="zod", year=2005)),
        main="Number of days in each zodiac sign",
        ylab=ylab)

barplot(table(mkseas(width="DJF", year=2005)),
        main="Number of days in each meteorological season",
        ylab=ylab)

barplot(table(mkseas(width=5, year=2004)),
        main="5-day categories", ylab=ylab)

barplot(table(mkseas(width=11, year=2005)),
        main="11-day categories", ylab=ylab)

barplot(table(mkseas(width=366 / 12, year=2005)),
        main="Number of days in 12-section year",
        sub="Note: not exactly the same as months")

# Application using synthetic data
dat <- data.frame(date=as.Date(paste(2005, 1:365), "%Y %j"),
  value=(-cos(1:365 * 2 * pi / 365) * 10 + rnorm(365) * 3 + 10))
attr(dat$date, "calendar") <- "365_day"

dat$d5 <- mkseas(dat, 5)
dat$d11 <- mkseas(dat, 11)
dat$month <- mkseas(dat, "mon")
dat$DJF <- mkseas(dat, "DJF")

plot(value ~ date, dat)
plot(value ~ d5, dat)
plot(value ~ d11, dat)
plot(value ~ month, dat)
plot(value ~ DJF, dat)

head(dat)

tapply(dat$value, dat$month, mean, na.rm=TRUE)
tapply(dat$value, dat$DJF, mean, na.rm=TRUE)

dat[which.max(dat$value),]
dat[which.min(dat$value),]

# start on a different day
st.day <- as.Date("2000-06-01")

dat$month <- mkseas(dat, "mon", start.day=st.day)
dat$d11 <- mkseas(dat, 11, start.day=st.day)
dat$DJF <- mkseas(dat, "DJF", start.day=st.day)

plot(value ~ d11, dat,
     main=.seasxlab(11, start.day=st.day))
plot(value ~ month, dat,
     main=.seasxlab("mon", start.day=st.day))
plot(value ~ DJF, dat,
     main=.seasxlab("DJF", start.day=st.day))



