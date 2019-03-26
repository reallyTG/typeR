library(PerformanceAnalytics)


### Name: chart.TimeSeries
### Title: Creates a time series chart with some extensions.
### Aliases: chart.TimeSeries chart.TimeSeries.base charts.TimeSeries

### ** Examples



# These are start and end dates, formatted as xts ranges.
## http://www.nber.org-cycles.html
cycles.dates<-c("1857-06/1858-12",
                "1860-10/1861-06",
                "1865-04/1867-12",
                "1869-06/1870-12",
                "1873-10/1879-03",
                "1882-03/1885-05",
                "1887-03/1888-04",
                "1890-07/1891-05",
                "1893-01/1894-06",
                "1895-12/1897-06",
                "1899-06/1900-12",
                "1902-09/1904-08",
                "1907-05/1908-06",
                "1910-01/1912-01",
                "1913-01/1914-12",
                "1918-08/1919-03",
                "1920-01/1921-07",
                "1923-05/1924-07",
                "1926-10/1927-11",
                "1929-08/1933-03",
                "1937-05/1938-06",
                "1945-02/1945-10",
                "1948-11/1949-10",
                "1953-07/1954-05",
                "1957-08/1958-04",
                "1960-04/1961-02",
                "1969-12/1970-11",
                "1973-11/1975-03",
                "1980-01/1980-07",
                "1981-07/1982-11",
                "1990-07/1991-03",
                "2001-03/2001-11",
                "2007-12/2009-06"
                )
# Event lists - FOR BEST RESULTS, KEEP THESE DATES IN ORDER
risk.dates = c(
    "Oct 87",
    "Feb 94",
    "Jul 97",
    "Aug 98",
    "Oct 98",
    "Jul 00",
    "Sep 01")
risk.labels = c(
    "Black Monday",
    "Bond Crash",
    "Asian Crisis",
    "Russian Crisis",
    "LTCM",
    "Tech Bubble",
    "Sept 11")
data(edhec)

R=edhec[,"Funds of Funds",drop=FALSE]
Return.cumulative = cumprod(1+R) - 1
chart.TimeSeries(Return.cumulative)
chart.TimeSeries(Return.cumulative, colorset = "darkblue", 
                 legend.loc = "bottomright", 
                 period.areas = cycles.dates, 
                 period.color = rgb(204/255, 204/255, 204/255, alpha=0.25), 
                 event.lines = risk.dates, 
                 event.labels = risk.labels, 
                 event.color = "red", lwd = 2)




