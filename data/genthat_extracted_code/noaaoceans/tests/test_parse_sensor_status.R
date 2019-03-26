
context('Check The parse_station status fuction')
# Prepare data for the test ----

# Set up a data frame to pase to the function
empty_df <- data.frame(station_id = c('123', '456'),
                       station_names = c('Aurthur Den', 'Ford Prefect'),
                       book = c(NA, NA),
                       towel = c(NA, NA),
                       peanuts = c(NA, NA))

# Create a data frame with the expected resutls
comparision_df <- data.frame(station_id = c('123', '456'),
                             station_names = c('Aurthur Den', 'Ford Prefect'),
                             book = c('1', '1'),
                             towel = c('1', '0'),
                             peanuts = c('0', '1'))

#Fix character types in our data frame with the expected resutls
comparision_df$book <- as.character(comparision_df$book)
comparision_df$towel <- as.character(comparision_df$towel)
comparision_df$peanuts <- as.character(comparision_df$peanuts)

# Create a string of html for our function to prase.
html_test_string <- '
<station name="Aurthur Dent" ID="123">
<parameter name="book" sensorID="A1" DCP="1" status="1"/>
<parameter name="towel" sensorID="C1" DCP="3" status="1"/>
<parameter name="peanuts" sensorID="D1" DCP="3" status="0"/>
</station>
<station name="Ford Prefect" ID="456">
<parameter name="book" sensorID="A1" DCP="1" status="1"/>
<parameter name="towel" sensorID="C1" DCP="3" status="0"/>
<parameter name="peanuts" sensorID="D1" DCP="3" status="1"/>
</station>
'

# Convert the string to an html object and then find all of the station nodes.
html <- xml2::read_html(html_test_string)
station_nodes <- rvest::html_nodes(html, 'station')

# Use our function to parse the html and append the results to the
# empty data frame.
output_df <- noaaoceans:::parse_sensor_status(station_nodes, empty_df)

# Run our tests.
test_that("The fuction returns a data frame",
          expect_is(output_df, 'data.frame'))


test_that('Check that parse station sensor performs as expected and returns a
           data frame that has the expected results', {
               expect_equal(output_df, comparision_df)
           })
