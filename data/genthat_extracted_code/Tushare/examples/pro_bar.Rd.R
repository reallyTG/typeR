library(Tushare)


### Name: pro_bar
### Title: Pro Bar to get quotations of different financial products
### Aliases: pro_bar

### ** Examples

## step 1. Use your token and call Tushare::pro_bar to get pro_bar interface
## You can get your token from the Tushare Pro website<https://tushare.pro>.
## Check details via visiting <https://tushare.pro/document/1?doc_id=38>
## and <https://tushare.pro/document/1?doc_id=39>.

## Not run: bar <- Tushare::pro_bar(token = 'YOUR TOKEN HERE')

## step 2. Use "bar" to get quotations of different financial products via passing specific
## parameters(see next lines). There are some examples after paramters introduction.
##
## parameters for "bar"
##
## ts_code:       the code to specify stock, fund or other products
## start_date:    the start date
## end_date:      the end date
## freq:          frequency, support 1/5/15/30/60 minutes, Weekly/Monthly/Quarterly/Annually
## asset:         security type,
##                    "E": stock, LOF
##                    "I": index
##                    "C": digital coin
##                    "F": forward/future/other stock and index except "A Share Stock"
## market:        code for market
## adj:           adjusted price, None/hfq/qfq
## ma:            moving average price, a number, 5 for ma5, 10 for ma10 ...
## retry_count:   times to retry



## Example 1. Two ways to get quotations of index
## Not run: 
##D   api(api_name = 'index_daily', ts_code = '000001.SH', start_date = '20181001',
##D       end_date = '20181010')
## End(Not run)
## Not run: 
##D   bar(ts_code = '000001.SH', start_date = "20181001", end_date = "20181010", asset = 'I')
## End(Not run)
## These two instructions will get the same data as below.
##     ts_code trade_date     close      open      high       low pre_close    change
## 1 000001.SH   20181010 2725.8367 2723.7242  2743.548 2703.0626  2721.013    4.8237
## 2 000001.SH   20181009  2721.013 2713.7319 2734.3142 2711.1971 2716.5104    4.5026
## 3 000001.SH   20181008 2716.5104 2768.2075 2771.9384 2710.1781 2821.3501 -104.8397
##   pct_change       vol      amount
## 1     0.1773 113485736 111312455.3
## 2     0.1657 116771899 110292457.8
## 3    -3.7159 149501388 141531551.8



## Example 2. Two ways to get quotations of stock
## Not run: 
##D   api(api_name = 'daily', ts_code = "000001.SZ", start_date = "20181001", end_date = "20181010")
## End(Not run)
## Not run: 
##D   bar(ts_code = "000001.SZ", start_date = "20181001", end_date = "20181010")
## End(Not run)
## These two instructions will get the same data as below.
##     ts_code trade_date  open  high   low close pre_close change pct_change        vol
## 1 000001.SZ   20181010 10.54 10.66 10.38 10.45     10.56  -0.11    -1.0417  995200.08
## 2 000001.SZ   20181009 10.46 10.70 10.39 10.56     10.45   0.11     1.0526 1064084.26
## 3 000001.SZ   20181008 10.70 10.79 10.45 10.45     11.05   -0.6    -5.4299 1686358.52
##        amount
## 1  1045666.18
## 2  1117946.55
## 3 1793455.283



## Example 3.  Get quotations of stock with adjusted price("hfq")
## Not run: 
##D   bar(ts_code = "000001.SZ", start_date = "20181001", end_date = "20181010", adj = "hfq")
## End(Not run)
##     ts_code trade_date    open    high     low   close pre_close change pct_change
## 1 000001.SZ   20181010 1138.65 1151.61 1121.36 1128.92   1140.81  -0.11    -1.0417
## 2 000001.SZ   20181009 1130.00 1155.93 1122.44 1140.81   1128.92   0.11     1.0526
## 3 000001.SZ   20181008 1155.93 1165.65 1128.92 1128.92   1193.74   -0.6    -5.4299
##          vol      amount
## 1  995200.08  1045666.18
## 2 1064084.26  1117946.55
## 3 1686358.52 1793455.283



## Example 4.  Get quotations of stock with adjusted price("qfq")
## Not run: 
##D   bar(ts_code = "000001.SZ", start_date = "20181001", end_date = "20181010", adj = "qfq")
## End(Not run)
##     ts_code trade_date  open  high   low close pre_close change pct_change        vol
## 1 000001.SZ   20181010 10.54 10.66 10.38 10.45     10.56  -0.11    -1.0417  995200.08
## 2 000001.SZ   20181009 10.46 10.70 10.39 10.56     10.45   0.11     1.0526 1064084.26
## 3 000001.SZ   20181008 10.70 10.79 10.45 10.45     11.05   -0.6    -5.4299 1686358.52
##        amount
## 1  1045666.18
## 2  1117946.55
## 3 1793455.283


## Example 5.  Get quotations of stock with adjusted price("hfq")
## and two moving average prices("ma5"" and "ma10"")
## Not run: 
##D   bar(ts_code = "000001.SZ", start_date = "20181001", adj = "hfq", ma = c(5,10))
## End(Not run)
##      ts_code trade_date    open    high     low   close pre_close change pct_change
## 1  000001.SZ   20181101 1187.26 1193.74 1162.41 1169.98   1178.62  -0.08    -0.7333
## 2  000001.SZ   20181031 1182.94 1187.26 1161.33 1178.62   1177.54   0.01     0.0917
## 3  000001.SZ   20181030 1164.57 1196.98 1159.17 1177.54   1161.33   0.15     1.3953
## 4  000001.SZ   20181029 1209.95 1214.27 1147.29 1161.33   1207.79  -0.43    -3.8462
## 5  000001.SZ   20181026 1219.67 1221.83 1184.02 1207.79   1219.67  -0.11    -0.9743
## 6  000001.SZ   20181025 1166.73 1219.67 1157.01 1219.67   1192.66   0.25     2.2645
## 7  000001.SZ   20181024 1177.54 1223.99 1166.73 1192.66   1171.06    0.2      1.845
## 8  000001.SZ   20181023 1209.95 1212.11 1159.17 1171.06   1204.55  -0.31    -2.7803
## 9  000001.SZ   20181022 1167.82 1238.04 1164.57 1204.55   1162.41   0.39     3.6245
## 10 000001.SZ   20181019 1074.91 1164.57 1071.67 1162.41   1090.03   0.67     6.6402
## 11 000001.SZ   20181018 1111.64 1111.64 1086.79 1090.03   1115.96  -0.24    -2.3233
## 12 000001.SZ   20181017 1134.33 1139.73 1095.43 1115.96   1120.28  -0.04    -0.3857
## 13 000001.SZ   20181016 1095.43 1138.65 1093.27 1120.28   1092.19   0.26     2.5717
## 14 000001.SZ   20181015 1122.44 1131.08 1090.03 1092.19   1112.72  -0.19    -1.8447
## 15 000001.SZ   20181012 1077.07 1117.04 1066.27 1112.72   1065.19   0.44     4.4625
## 16 000001.SZ   20181011 1085.71 1097.59 1047.90 1065.19   1128.92  -0.59    -5.6459
## 17 000001.SZ   20181010 1138.65 1151.61 1121.36 1128.92   1140.81  -0.11    -1.0417
## 18 000001.SZ   20181009 1130.00 1155.93 1122.44 1140.81   1128.92   0.11     1.0526
## 19 000001.SZ   20181008 1155.93 1165.65 1128.92 1128.92   1193.74   -0.6    -5.4299
##           vol      amount     ma5    ma10
## 1  1542776.32 1679443.449 1179.05 1176.57
## 2  1152683.79 1252156.775 1188.99 1170.30
## 3  1501827.86 1641371.787 1191.80 1164.57
## 4  1591628.78 1725932.497 1190.50 1157.66
## 5   1299975.1 1448843.512 1199.15 1148.15
## 6  1685011.36 1855823.739 1190.07 1132.71
## 7  1829424.64 2026171.911 1164.14 1126.33
## 8  1602545.92 1759265.958 1148.80 1123.31
## 9  2645543.12  2932714.47 1138.65 1115.74
## 10 2083667.32 2173571.254 1116.17      NA
## 11 1001156.05 1015654.821 1106.24      NA
## 12 1350889.83 1400306.336 1101.27      NA
## 13 1396921.05 1450020.371 1103.86      NA
## 14  1402685.3 1443043.059 1107.97      NA
## 15 1516810.28   1532651.4 1115.31    <NA>
## 16 1995143.83 1994186.611      NA    <NA>
## 17  995200.08  1045666.18      NA    <NA>
## 18 1064084.26  1117946.55    <NA>    <NA>
## 19 1686358.52 1793455.283    <NA>    <NA>



