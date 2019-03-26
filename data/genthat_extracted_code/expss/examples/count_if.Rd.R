library(expss)


### Name: count_if
### Title: Count/sum/average/other functions on values that meet a
###   criterion
### Aliases: count_if count_row_if count_col_if %row_in% %has% %col_in%
###   sum_if sum_row_if sum_col_if mean_if mean_row_if mean_col_if sd_if
###   sd_row_if sd_col_if median_if median_row_if median_col_if max_if
###   max_row_if max_col_if min_if min_row_if min_col_if apply_row_if
###   apply_col_if

### ** Examples

set.seed(123)
dfs = as.data.frame(
       matrix(sample(c(1:10,NA), 30, replace = TRUE), 10)
)

result  = modify(dfs, {
             # count 8
             exact = count_row_if(8, V1, V2, V3)
             # count values greater than 8
             greater = count_row_if(gt(8), V1, V2, V3)
             # count integer values between 5 and 8, e. g. 5, 6, 7, 8
             integer_range = count_row_if(5:8, V1, V2, V3)
             # count values between 5 and 8 
             range = count_row_if(5 %thru% 8, V1, V2, V3)
             # count NA 
             na = count_row_if(is.na, V1, V2, V3)
             # count not-NA 
             not_na = count_row_if(not_na, V1, V2, V3) 
             # are there any 5 in each row?
             has_five = cbind(V1, V2, V3) %row_in% 5   
         })  
result
 
mean_row_if(6, dfs$V1, data = dfs)
median_row_if(gt(2), dfs$V1, dfs$V2, dfs$V3) 
sd_row_if(5 %thru% 8, dfs$V1, dfs$V2, dfs$V3)
 
if_na(dfs) = 5 # replace NA 

# custom apply
apply_col_if(prod, gt(2), dfs$V1, data = dfs) # product of all elements by columns
apply_row_if(prod, gt(2), dfs$V1, data = dfs) # product of all elements by rows
 
# Examples borrowed from Microsoft Excel help for COUNTIF
df1 = data.frame(
    a = c("apples",   "oranges",     "peaches",     "apples"),
    b = c(32, 54, 75, 86)
)

count_if("apples", df1$a) # 2

count_if("apples", df1) # 2

with(df1, count_if("apples", a, b)) # 2

count_if(gt(55), df1$b) # greater than 55 = 2

count_if(ne(75), df1$b) # not equal 75 = 3

count_if(ge(32), df1$b) # greater than or equal 32 = 4

count_if(gt(32) & lt(86), df1$b) # 2

# count only integer values between 33 and 85
count_if(33:85, df1$b) # 2

# values with letters
count_if(regex("^[A-z]+$"), df1) # 4

# values that started on 'a'
count_if(regex("^a"), df1) # 2

# count_row_if
count_row_if(regex("^a"), df1) # c(1,0,0,1)

df1 %row_in% 'apples'  # c(TRUE,FALSE,FALSE,TRUE)

# Some of Microsoft Excel examples for SUMIF/AVERAGEIF/etc 
dfs = read.csv(
    text = "
    property_value,commission,data
    100000,7000,250000
    200000,14000,	
    300000,21000,	
    400000,28000,"
)

# Sum of commision for property value greater than 160000
with(dfs, sum_if(gt(160000), property_value, data = commission)) # 63000
    
# Sum of property value greater than 160000
with(dfs, sum_if(gt(160000), property_value)) # 900000

# Sum of commision for property value equals to 300000
with(dfs, sum_if(300000, property_value, data = commission)) # 21000
    
# Sum of commision for property value greater than first value of data
with(dfs, sum_if(gt(data[1]), property_value, data = commission)) # 49000
    

dfs = data.frame(
    category = c("Vegetables", "Vegetables", "Fruits", "", "Vegetables", "Fruits"),
    food = c("Tomatoes", "Celery", "Oranges", "Butter", "Carrots", "Apples"),
    sales = c(2300, 5500, 800, 400, 4200, 1200),
    stringsAsFactors = FALSE
)

# Sum of sales for Fruits
with(dfs, sum_if("Fruits", category, data = sales)) # 2000

# Sum of sales for Vegetables    
with(dfs, sum_if("Vegetables", category, data = sales)) # 12000

# Sum of sales for food which is ending on 'es' 
with(dfs, sum_if(perl("es$"), food, data = sales)) # 4300

# Sum of sales for empty category
with(dfs, sum_if("", category, data = sales))  # 400


dfs = read.csv(
    text = "
    property_value,commission,data
    100000,7000,250000
    200000,14000,	
    300000,21000,	
    400000,28000,"
)

# Commision average for comission less than 23000
with(dfs, mean_if(lt(23000), commission)) # 14000


# Property value average for property value less than 95000
with(dfs, mean_if(lt(95000), property_value)) #  NaN

# Commision average for property value greater than 250000
with(dfs, mean_if(gt(250000), property_value, data = commission)) # 24500


dfs = data.frame(
    region = c("East", "West", "North", "South (New Office)",  "MidWest"),
    profits = c(45678, 23789, -4789, 0, 9678),
    stringsAsFactors = FALSE
)


# Mean profits for 'west' regions
with(dfs, mean_if(fixed("West"), region, data = profits)) # 16733.5


# Mean profits for regions wich doesn't contain New Office
with(dfs, mean_if(!fixed("(New Office)"), region, data = profits))  # 18589


dfs = read.csv(
    text = '
    grade,weight 
    89,1
    93,2
    96,2
    85,3
    91,1
    88,1'
    ,stringsAsFactors = FALSE
)

# Minimum grade for weight equals to 1
with(dfs, min_if(1, weight, data = grade)) # 88


# Maximum grade for weight equals to 1
with(dfs, max_if(1, weight, data = grade)) #91


# Example with offset
dfs = read.csv(
    text = '
    weight,grade 
    10,b
    11,a
    100,a
    111,b
    1,a
    1,a'
    ,stringsAsFactors = FALSE
)

with(dfs, min_if("a", grade[2:5], data = weight[1:4])) # 10





