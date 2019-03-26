context("Calendars")

suppressPackageStartupMessages(library("lubridate"))

test_that("Empty calendar is correct", {
  expect_identical(res <- is_good(ymd(20170101) + days(0:365), EmptyCalendar()),
    rep_len(TRUE, length(res)))
})

test_that('Sydney calendar is correct', {
  # Source: http://www.industrialrelations.nsw.gov.au/oirwww/NSW_public_holidays/NSW_Public_Holidays_2013-2015.page
  syd_hol_2013 <- ymd(20130101, 20130128, 20130329, 20130330,
    20130331, 20130401, 20130425, 20130610,
    20130805, 20131007, 20131225, 20131226)
  syd_hol_2014 <- ymd(20140101, 20140127, 20140418, 20140419,
    20140420, 20140421, 20140425, 20140609,
    20140804, 20141006, 20141225, 20141226)

  # Check bad days are bad
  ausy <- AUSYCalendar()
  expect_identical(is_good(syd_hol_2013, ausy), rep(FALSE, NROW(syd_hol_2013)))
  expect_identical(is_good(syd_hol_2014, ausy), rep(FALSE, NROW(syd_hol_2014)))

  # Check weekends bad
  expect_equal(is_good(ymd(20150214, 20150215), ausy), c(FALSE, FALSE))

  # Check good days are ok
  bd2013 <- as_date(origin) + setdiff(ymd(20130101) + days(0:364), syd_hol_2013)
  bd2013 <- bd2013[!(wday(bd2013) %in% c(1, 7))]
  bd2014 <- as_date(origin) + setdiff(ymd(20140101) + days(0:364), syd_hol_2014)
  bd2014 <- bd2014[!(wday(bd2014) %in% c(1, 7))]
  expect_identical(is_good(bd2013, ausy), rep(TRUE, NROW(bd2013)))
  expect_identical(is_good(bd2014, ausy), rep(TRUE, NROW(bd2014)))
})


test_that('Melbourne calendar is correct', {
  # Source: http://www.industrialrelations.nsw.gov.au/oirwww/NSW_public_holidays/NSW_Public_Holidays_2013-2015.page
  mel_hol_2013 <- ymd(20130101, 20130128, 20130311, 20130329,
    20130330, 20130401, 20130425, 20130610,
    20131105, 20131225, 20131226)
  mel_hol_2014 <- ymd(20140101, 20140127, 20140310, 20140418,
    20140419, 20140421, 20140425, 20140609,
    20141104, 20141225, 20141226)

  # Check bad days are bad
  aume <- AUMECalendar()
  expect_identical(is_good(mel_hol_2013, aume), rep(FALSE, NROW(mel_hol_2013)))
  expect_identical(is_good(mel_hol_2014, aume), rep(FALSE, NROW(mel_hol_2014)))

  # Check weekends bad
  expect_equal(is_good(ymd(20150214, 20150215), aume), c(FALSE, FALSE))

  # Check good days are ok
  bd2013 <- as_date(origin) + setdiff(ymd(20130101) + days(0:364), mel_hol_2013)
  bd2013 <- bd2013[!(wday(bd2013) %in% c(1, 7))]
  bd2014 <- as_date(origin) + setdiff(ymd(20140101) + days(0:364), mel_hol_2014)
  bd2014 <- bd2014[!(wday(bd2014) %in% c(1, 7))]
  expect_identical(is_good(bd2013, aume), rep(TRUE, NROW(bd2013)))
  expect_identical(is_good(bd2014, aume), rep(TRUE, NROW(bd2014)))
})


test_that('NYC calendar is correct', {
  # Source:
  # http://www.cs.ny.gov/attendance_leave/2012_legal_holidays.cfm
  # http://www.cs.ny.gov/attendance_leave/2013_legal_holidays.cfm
  # Removed Lincoln's Birthday and Election Day as they are floating hols
  hol_2012 <- ymd(20120101, 20120102, 20120116, 20120212, 20120220, 20120528,
    20120704, 20120903, 20121008, 20121111, 20121112, 20121122,
    20121225)
  hol_2013 <- ymd(20130101, 20130121, 20130218, 20130527, 20130704, 20130902,
    20131014, 20131111, 20131128, 20131225)

  # Check bad days are bad
  usny <- USNYCalendar()
  expect_identical(is_good(hol_2012, usny), rep(FALSE, NROW(hol_2012)))
  expect_identical(is_good(hol_2013, usny), rep(FALSE, NROW(hol_2013)))

  # Check weekends bad
  expect_equal(is_good(ymd(20150214, 20150215),usny), c(FALSE, FALSE))

  # Check good days are ok
  bd2012 <- as_date(origin) + setdiff(ymd(20120101) + days(0:365), hol_2012)
  bd2012 <- bd2012[!(wday(bd2012) %in% c(1, 7))]
  bd2013 <- as_date(origin) + setdiff(ymd(20130101) + days(0:364), hol_2013)
  bd2013 <- bd2013[!(wday(bd2013) %in% c(1, 7))]
  expect_identical(is_good(bd2012, usny), rep(TRUE, NROW(bd2012)))
  expect_identical(is_good(bd2013, usny), rep(TRUE, NROW(bd2013)))
})

test_that('London calendar is correct', {
  # Source:
  # http://www.timeanddate.com/calendar/?year=2012&country=9
  # http://www.timeanddate.com/calendar/?year=2013&country=9
  hol_2012 <- ymd(20120101, 20120102, 20120406, 20120409, 20120507, 20120604,
    20120605, 20120827, 20121225, 20121226)
  hol_2013 <- ymd(20130101, 20130329, 20130401, 20130506, 20130527, 20130826,
    20131225, 20131226)

  # Check bad days are bad
  gblo <- GBLOCalendar()
  expect_identical(is_good(hol_2012, gblo), rep(FALSE, NROW(hol_2012)))
  expect_identical(is_good(hol_2013, gblo), rep(FALSE, NROW(hol_2013)))

  # Check weekends bad
  expect_equal(is_good(ymd(20150214, 20150215),gblo), c(FALSE, FALSE))

  # Check good days are ok
  bd2012 <- as_date(origin) + setdiff(ymd(20120101) + days(0:365), hol_2012)
  bd2012 <- bd2012[!(wday(bd2012) %in% c(1, 7))]
  bd2013 <- as_date(origin) + setdiff(ymd(20130101) + days(0:364), hol_2013)
  bd2013 <- bd2013[!(wday(bd2013) %in% c(1, 7))]
  expect_identical(is_good(bd2012, gblo), rep(TRUE, NROW(bd2012)))
  expect_identical(is_good(bd2013, gblo), rep(TRUE, NROW(bd2013)))
})

test_that('TARGET calendar is correct', {
  # Source:
  # https://web.archive.org/web/20130511041319/http://www.bundesbank.de/Redaktion/EN/Downloads/Press/Publications/ecb_holidays_2013.pdf?__blob=publicationFile
  hol_2013 <- ymd(20130101, 20130329, 20130401, 20130501, 20131225, 20131226)

  # Check bad days are bad
  euta <- EUTACalendar()
  expect_identical(is_good(hol_2013, euta), rep(FALSE, NROW(hol_2013)))

  # Check weekends bad
  expect_equal(is_good(ymd(20150214, 20150215),euta), c(FALSE, FALSE))

  # Check good days are ok
  bd2013 <- as_date(origin) + setdiff(ymd(20130101) + days(0:364), hol_2013)
  bd2013 <- bd2013[!(wday(bd2013) %in% c(1, 7))]
  expect_identical(is_good(bd2013, euta), rep(TRUE, NROW(bd2013)))
})

test_that('Auckland and Wellington calendars are correct', {
  # Source:
  # http://www.dol.govt.nz/er/holidaysandleave/publicholidays/publicholidaydates/future-dates.asp
  akl_hol_2014 <- dmy(01012014, 02012014, 06022014, 27012014, 18042014,
    21042014, 25042014, 02062014, 27102014, 25122014, 26122014)
  akl_hol_2016 <- dmy(01012016, 04012016, 08022016, 01022016, 25032016, 28032016,
    25042016, 06062016, 24102016, 27122016, 26122016)
  wlg_hol_2016 <- dmy(01012016, 04012016, 08022016, 25012016, 25032016, 28032016,
    25042016, 06062016, 24102016, 27122016, 26122016)

  # Check bad days are bad
  nzau <- NZAUCalendar()
  nzwe <- NZWECalendar()
  expect_identical(is_good(akl_hol_2014, nzau), rep(FALSE, NROW(akl_hol_2014)))
  expect_identical(is_good(akl_hol_2016, nzau), rep(FALSE, NROW(akl_hol_2016)))
  expect_identical(is_good(wlg_hol_2016, nzwe), rep(FALSE, NROW(wlg_hol_2016)))

  # Check weekends bad
  expect_equal(is_good(ymd(20150214, 20150215),nzau), c(FALSE, FALSE))
  expect_equal(is_good(ymd(20150214, 20150215),nzwe), c(FALSE, FALSE))

  # Check good days are ok
  bd2014 <- as_date(origin) + setdiff(ymd(20140101) + days(0:364), akl_hol_2014)
  bd2014 <- bd2014[!(wday(bd2014) %in% c(1, 7))]
  expect_identical(is_good(bd2014, nzau), rep(TRUE, NROW(bd2014)))
  bd2016 <- as_date(origin) + setdiff(ymd(20160101) + days(0:365), wlg_hol_2016)
  bd2016 <- bd2016[!(wday(bd2016) %in% c(1, 7))]
  expect_identical(is_good(bd2016, nzwe), rep(TRUE, NROW(bd2016)))
})

test_that('Toyko calendars are correct', {
  # Source:
  # http://www.boj.or.jp/en/about/outline/holi.htm/
  hol_2013 <- dmy(01012013, 02012013, 03012013, 14012013, 11022013, 20032013,
    29042013, 03052013, 04052013, 05052013, 06052013, 15072013,
    16092013, 23092013, 14102013, 03112013, 04112013, 23112013,
    23122013, 31122013)
  hol_2014 <- dmy(01012014, 02012014, 03012014, 13012014, 11022014, 21032014,
    29042014, 03052014, 04052014, 05052014, 06052014, 21072014,
    15092014, 23092014, 13102014, 03112014, 23112014, 24112014,
    23122014, 31122014)

  # Check bad days are bad
  jpto <- JPTOCalendar()
  expect_identical(is_good(hol_2013, jpto), rep(FALSE, NROW(hol_2013)))
  expect_identical(is_good(hol_2014, jpto), rep(FALSE, NROW(hol_2014)))

  # Check weekends bad
  expect_equal(is_good(ymd(20150214, 20150215),jpto), c(FALSE, FALSE))

  # Check good days are ok
  bd2013 <- as_date(origin) + setdiff(ymd(20130101) + days(0:364), hol_2013)
  bd2013 <- bd2013[!(wday(bd2013) %in% c(1, 7))]
  expect_identical(is_good(bd2013, jpto), rep(TRUE, NROW(bd2013)))
  bd2014 <- as_date(origin) + setdiff(ymd(20140101) + days(0:364), hol_2014)
  bd2014 <- bd2014[!(wday(bd2014) %in% c(1, 7))]
  expect_identical(is_good(bd2014, jpto), rep(TRUE, NROW(bd2014)))
})


test_that("Zurich calendars are correct", {
  # Source
  # https://en.wikipedia.org/w/index.php?title=Public_holidays_in_Switzerland&oldid=703235689
  h2016 <- dmy(01012016, 02012016, 24032016, 25032016, 28032016, 01052016,
    05052016, 16052016, 01082016, 18092016, 24122016, 25122016, 26122016,
    31122016)
  h2017 <- dmy(01012017, 02012017, 13042017, 14042017, 17042017, 01052017,
    25052017, 05062017, 01082017, 17092017, 24122017, 25122017, 26122017,
    31122017)

  # Check bad days are bad
  chzh <- CHZHCalendar()
  expect_identical(is_good(h2016, chzh), rep(FALSE, NROW(h2016)))
  expect_identical(is_good(h2017, chzh), rep(FALSE, NROW(h2017)))

  # Check weekends are bad
  expect_equal(is_good(ymd(20150214, 20150215),chzh), c(FALSE, FALSE))

  # Check good days are ok
  g2016 <- as_date(origin) + setdiff(ymd(20160101) + days(0:365), h2016)
  g2016 <- g2016[!(wday(g2016) %in% c(1, 7))]
  expect_identical(is_good(g2016, chzh), rep(TRUE, NROW(g2016)))
  g2017 <- as_date(origin) + setdiff(ymd(20170101) + days(0:364), h2017)
  g2017 <- g2017[!(wday(g2017) %in% c(1, 7))]
  expect_identical(is_good(g2017, chzh), rep(TRUE, NROW(g2017)))
})

test_that("Hong Kong calendars are correct", {
  # Source
  # http://www.gov.hk/en/about/abouthk/holiday/
  h2016 <- dmy(01012016, 08022016, 09022016, 10022016, 25032016, 26032016,
    28032016, 04042016, 02052016, 14052016, 09062016, 01072016, 16092016,
    01102016, 10102016, 26122016, 27122016)

  # Check bad days are bad
  hk <- HKHKCalendar()
  expect_identical(is_good(h2016, hk), rep(FALSE, NROW(h2016)))

  # Check weekends are bad
  expect_identical(is_good(ymd(20150214, 20150215),hk), c(FALSE, FALSE))

  # Check good days are ok
  g2016 <- as_date(origin) + setdiff(ymd(20160101) + days(0:365), h2016)
  g2016 <- g2016[!(wday(g2016) %in% c(1, 7))]
  expect_identical(is_good(g2016, hk), rep(TRUE, NROW(g2016)))
})

test_that("Oslo calendars are correct", {
  # Source
  # http://www.timeanddate.com/holidays/norway/#!hol=1
  h2016 <- dmy(01012016, 24032016, 25032016, 27032016, 28032016,
    01052016, 05052016, 15052016, 16052016, 17052016, 25122016, 26122016)

  # Check bad days are bad
  noos <- NOOSCalendar()
  expect_identical(is_good(h2016, noos), rep(FALSE, NROW(h2016)))

  # Check weekends are bad
  expect_identical(is_good(ymd(20150214, 20150215),noos), c(FALSE, FALSE))

  # Check good days are ok
  g2016 <- as_date(origin) + setdiff(ymd(20160101) + days(0:365), h2016)
  g2016 <- g2016[!(wday(g2016) %in% c(1, 7))]
  expect_identical(is_good(g2016, noos), rep(TRUE, NROW(g2016)))
})


test_that("Joint calendars work effectively", {
  hols <- ymd(20141006, 20141104, 20141225)
  syme <- JointCalendar(list(AUSYCalendar(), AUMECalendar()), all)
  expect_identical(is_good(hols, syme), c(FALSE, FALSE, FALSE))
  syme$rule <- any
  expect_identical(is_good(hols, syme), c(TRUE, TRUE, FALSE))
  expect_true(is(c(AUSYCalendar(), AUMECalendar()), "JointCalendar"))
  expect_equal(c(AUSYCalendar(), AUSYCalendar()),
    JointCalendar(list(AUSYCalendar())))
  expect_equal(syme[2], JointCalendar(list(AUMECalendar()), any))
})

test_that("Concatention works", {
  expect_is(c(AUSYCalendar(), AUMECalendar()), "JointCalendar")
  expect_is(c(c(AUSYCalendar(), AUMECalendar()), USNYCalendar()), "JointCalendar")
  expect_is(c(USNYCalendar(), c(AUSYCalendar(), AUMECalendar())), "JointCalendar")
})


test_that("Subsetting works", {
  syny <- c(AUSYCalendar(), USNYCalendar())
  expect_equal(syny[1], c(AUSYCalendar()))
  expect_equal(syny[2], c(USNYCalendar()))
  expect_equal(syny[1:2], syny)
  expect_equal(syny[c(TRUE, FALSE)], syny[1])
  expect_equal(syny[c(FALSE, TRUE)], syny[2])
  expect_equal(syny[c(TRUE, TRUE)], syny)
})

test_that("Calendar checkers", {
  expect_true(is.Calendar(EmptyCalendar()))
  expect_false(is.JointCalendar(EmptyCalendar()))
  expect_true(is.JointCalendar(c(AUSYCalendar(), AUMECalendar())))
  expect_false(is.Calendar(c(AUSYCalendar(), AUMECalendar())))
})