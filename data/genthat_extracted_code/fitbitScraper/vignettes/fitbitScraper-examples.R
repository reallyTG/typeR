## ------------------------------------------------------------------------
library("fitbitScraper")
cookie <- login(email="corynissen@gmail.com", password=Sys.getenv("FBPW"))

## ---- fig.height=4, fig.width=5, message=FALSE, warning=FALSE, fig.align='center'----
dates <- seq(as.Date("2016-04-03"), as.Date("2016-04-09"), by="day")
df_list <- lapply(dates, function(x)
  get_intraday_data(cookie=cookie, what="steps", as.character(x)))
df <- do.call(rbind, df_list)

library("ggplot2")
library("ggthemes")
ggplot(df) + 
  geom_bar(aes(x=time, y=steps), stat="identity") + 
  theme_tufte() + 
  scale_x_datetime(name="date", date_breaks="1 day", date_labels="%b-%d")

## ---- fig.height=4, fig.width=5, message=FALSE, warning=FALSE, fig.align='center'----
df <- get_daily_data(cookie=cookie, what="floors", start_date="2016-02-15",
                     end_date="2016-05-01")
df$weekday <- format(df$time, "%A")
avgs <- by(df$floors, df$weekday, mean)
avgs <- data.frame(day=names(avgs), floors=as.numeric(avgs))
avgs$day <- factor(avgs$day, levels=avgs$day[c(4, 2, 6, 7, 5, 1, 3)])

ggplot(avgs) + 
  geom_bar(aes(x=day, y=floors), stat="identity") + 
  theme_tufte() + 
  xlab("") + 
  ylab("") + 
  ggtitle("Average Floors by Day 2016-02-15 to 2016-05-01") + 
  geom_text(aes(x=day,y=floors,label=round(floors, 1)),
            vjust=1.1, colour="white") + 
  theme(axis.text.y=element_blank(), axis.ticks.y=element_blank()) + 
  theme(plot.title=element_text(vjust=.5)) 

## ---- fig.height=4, fig.width=5, message=FALSE, warning=FALSE, fig.align='center'----
# don't do this...
# mywt <- get_weight_data(cookie, start_date="2015-01-01", end_date="2015-05-01")
start_date <- as.Date("2015-01-01")
end_date <- as.Date("2015-05-01")
wt_df_list <- list()      # initialize a list to put the weight dataframes into
in_range <- TRUE          # indicator variable to tell when to exit while loop
s_date <- start_date      # date to start with during loop
while(in_range){
  e_date <- s_date + 14
  new_df <- get_weight_data(cookie, start_date=as.character(s_date),
                            end_date=as.character(e_date))
  wt_df_list[[as.character(s_date)]] <- new_df
  s_date <- e_date + 1
  if(e_date > end_date) in_range <- FALSE
}
wt_df <- do.call(rbind, wt_df_list)
wt_df <- wt_df[!duplicated(wt_df$time), ]
wt_df <- wt_df[order(wt_df$time), ]
wt_df <- wt_df[as.Date(wt_df$time) >= start_date &
               as.Date(wt_df$time) <= end_date, ]

step_df <- get_daily_data(cookie=cookie, what="steps", start_date="2015-01-01",
                          end_date="2015-05-01")

# get common date format to merge data sets...
wt_df$date <- as.character(as.Date(wt_df$time))
step_df$date <- as.character(as.Date(step_df$time))

# merge by date
df <- merge(wt_df, step_df, by="date")

# now plot
ggplot(df, aes(x=steps, y=weight)) + 
  geom_point() + 
  stat_smooth(se=FALSE) + 
  theme_tufte()

