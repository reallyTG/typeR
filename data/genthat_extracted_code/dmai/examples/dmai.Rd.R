library(dmai)


### Name: dmai
### Title: Divisia Monetary Aggregates Index
### Aliases: dmai dmai.default

### ** Examples


Data <-
  tibble::tibble(
    Date = paste(c("Jun", "Dec"), rep(seq(from = 2000, to = 2017, by = 1), each = 2), sep = "-")
  , x1    = runif(n = 36, min = 162324, max = 2880189)
  , x2    = runif(n = 36, min = 2116,   max =   14542)
  , x3    = runif(n = 36, min = 92989,  max = 3019556)
  , x4    = runif(n = 36, min = 205155, max = 4088784)
  , x5    = runif(n = 36, min = 6082,   max =  186686)
  , x6    = runif(n = 36, min = 11501,  max =   50677)
  , x7    = runif(n = 36, min = 61888,  max =  901419)
  , x8    = runif(n = 36, min = 13394,  max =  347020)
  , x9    = runif(n = 36, min = 25722,  max =  701887)
  , x10   = runif(n = 36, min = 6414,   max =   37859)
  , x11   = runif(n = 36, min = 11688,  max =  113865)
  , x12   = runif(n = 36, min = 2311,   max =   23130)
  , x13   = runif(n = 36, min = 23955,  max =  161318)
  , r1    = runif(n = 36, min = 0.00,   max =  0.00)
  , r2    = runif(n = 36, min = 0.00,   max = 0.00)
  , r3    = runif(n = 36, min = 0.00,   max = 0.00)
  , r4    = runif(n = 36, min = 0.93,   max = 7.43)
  , r5    = runif(n = 36, min = 1.12,   max = 7.00)
  , r6    = runif(n = 36, min = 0.99,   max = 7.93)
  , r7    = runif(n = 36, min = 1.51,   max = 7.42)
  , r8    = runif(n = 36, min = 2.20,   max = 9.15)
  , r9    = runif(n = 36, min = 2.64,   max = 9.37)
  , r10   = runif(n = 36, min = 2.80,   max = 11.34)
  , r11   = runif(n = 36, min = 3.01,   max = 12.41)
  , r12   = runif(n = 36, min = 2.78,   max = 13.68)
  , r13   = runif(n = 36, min = 3.23,   max = 14.96)
  )

Data$Date <- as.Date(paste("01", Data$Date, sep = "-"), format = "%d-%b-%Y")
Data
DMAI <- dmai(.data = Data)
DMAI

library(ggplot2)
ggplot(data = DMAI, mapping = aes(x = Date, y = DMAI)) +
  geom_point() +
  geom_line() +
  geom_text(aes(label = round(DMAI, 2)), vjust = "inward", hjust = "inward") +
  scale_x_date(
                date_breaks = "6 months"
              , date_labels = "%b-%Y"
              , limits = c(min(DMAI$Date), max = max(DMAI$Date))) +
  theme_bw() +
  theme(axis.text.x  = element_text(angle = 90))





