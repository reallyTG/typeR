context('encodefrom')

## -----------------------------------------------------------------------------
## PRELIM
## -----------------------------------------------------------------------------

## set up data
df <- tibble::tibble(state = c('Texas','Louisiana','Massachusetts',
                               'Florida','Oregon','Montana',
                               'Washington','Arkansas','Tennessee',
                               'Mississippi','Utah','Alabama',
                               'Kentucky','Maine','Michigan',
                               'California','Illinois','Delaware',
                               'Idaho','North Carolina','Nebraska',
                               'Maryland','Virginia','Pennsylvania',
                               'Rhode Island','South Carolina','Iowa',
                               'New Hampshire','Kansas','Nevada',
                               'South Dakota','Colorado','Arizona',
                               'Alaska','New York','Oklahoma',
                               'Wisconsin','Wyoming','Connecticut',
                               'Missouri','Minnesota','Ohio',
                               'Georgia','New Jersey','Vermont',
                               'District of Columbia','North Dakota',
                               'New Mexico','West Virginia','Indiana',
                               'Hawaii'),
                         y = seq(1:51))

crosswalk_file <- system.file('extdata', 'stcrosswalk.rda',
                              package = 'crosswalkr')

## encode vector
vec <- encodefrom(df, state, crosswalk_file, stname, stfips, stabbr)

## -----------------------------------------------------------------------------
## TESTS
## -----------------------------------------------------------------------------

test_that('Not proper labelled class', {
    ## skip until new haven is out
    ## skip_on_cran()
    ## skip_on_travis()
    expect_is(vec, 'haven_labelled')

})

test_that('Failed to properly label vector', {

    lab_names <- c('AL','AK','AZ','AR','CA','CO','CT','DE','DC','FL','GA','HI',
                   'ID','IL','IN','IA','KS','KY','LA','ME','MD','MA','MI','MN',
                   'MS','MO','MT','NE','NV','NH','NJ','NM','NY','NC','ND','OH',
                   'OK','OR','PA','RI','SC','SD','TN','TX','UT','VT','VA','WA',
                   'WV','WI','WY')
    lab_vals <- c(1:2,4:6,8:13,15:42,44:51,53:56)
    names(lab_vals) <- lab_names

    expect_equal(names(attr(vec, 'labels', exact = TRUE)), lab_names)
    expect_equal(attr(vec, 'labels', exact = TRUE), lab_vals)

})

test_that('Failed to assign proper values', {

    act_vals <- c(48L,22L,25L,12L,41L,30L,53L,5L,47L,28L,49L,1L,
                  21L,23L,26L,6L,17L,10L,16L,37L,31L,24L,51L,42L,
                  44L,45L,19L,33L,20L,32L,46L,8L,4L,2L,36L,40L,
                  55L,56L,9L,29L,27L,39L,13L,34L,50L,11L,38L,35L,
                  54L,18L,15L)

    expect_equal(haven::zap_labels(vec), act_vals)

})

## encode vector (factor)
vec <- encodefrom(df, state, crosswalk_file, stname, stfips,
                  stabbr, ignore_tibble = TRUE)

test_that('Not proper factor class', {

    expect_is(vec, 'factor')

})

test_that('Failed to properly label factor', {

    lab_names <- c('AL','AK','AZ','AR','CA','CO','CT','DE','DC','FL','GA','HI',
                   'ID','IL','IN','IA','KS','KY','LA','ME','MD','MA','MI','MN',
                   'MS','MO','MT','NE','NV','NH','NJ','NM','NY','NC','ND','OH',
                   'OK','OR','PA','RI','SC','SD','TN','TX','UT','VT','VA','WA',
                   'WV','WI','WY')
    lab_vals <- as.character(c(1:2,4:6,8:13,15:42,44:51,53:56))
    names(lab_vals) <- lab_names

    expect_equal(levels(vec), lab_names)
    expect_equal(labels(vec), as.character(1:51))

})

test_that('Failed to assign proper values', {

    act_vals <- c('TX','LA','MA','FL','OR','MT','WA','AR','TN','MS','UT',
                  'AL','KY','ME','MI','CA','IL','DE','ID','NC','NE','MD',
                  'VA','PA','RI','SC','IA','NH','KS','NV','SD','CO','AZ',
                  'AK','NY','OK','WI','WY','CT','MO','MN','OH','GA','NJ',
                  'VT','DC','ND','NM','WV','IN','HI')

    expect_equal(as.character(vec), act_vals)

})


