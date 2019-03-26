context("Empty PO/POT files")

test_that(
  "read_po works on an empty POT file",
  {
    pot_file <- system.file("extdata/R-empty-raw.pot", package = "poio")
    expected <- po(
      source_type = "r",
      file_type   = "pot",
      initial_comments = character(),
      metadata    = tibble::data_frame(
        name = c(
          "Project-Id-Version", "Report-Msgid-Bugs-To", "POT-Creation-Date",
          "PO-Revision-Date", "Last-Translator", "Language-Team",
          "MIME-Version", "Content-Type", "Content-Transfer-Encoding"
        ),
        value = c(
          "R 3.3.1", "bugs.r-project.org", "2016-10-05 20:19",
          "YEAR-MO-DA HO:MI+ZONE", "FULL NAME <EMAIL@ADDRESS>", "LANGUAGE <LL@li.org>",
          "1.0", "text/plain; charset=CHARSET", "8bit"
        )
      ),
      direct = poio:::append_key(
        tibble::data_frame(
          msgid                     = character(),
          msgstr                    = character(),
          is_obsolete               = logical(),
          msgctxt                   = list(),
          translator_comments       = list(),
          source_reference_comments = list(),
          flags_comments            = list(),
          previous_string_comments  = list()
        )
      ),
      countable = poio:::append_key(
        tibble::data_frame(
          msgid                     = character(),
          msgid_plural              = character(),
          msgstr                    = list(),
          is_obsolete               = logical(),
          msgctxt                   = list(),
          translator_comments       = list(),
          source_reference_comments = list(),
          flags_comments            = list(),
          previous_string_comments  = list()
        )
      )
    )
    actual <- read_po(pot_file)
    expect_po_equal(actual, expected)
  }
)

test_that(
  "fix_metadata works on an empty pot file",
  {
    pot_file <- system.file("extdata/R-empty-raw.pot", package = "poio")
    me <- paste0(whoami::fullname("FULL NAME"), " <", whoami::email_address("EMAIL@ADDRESS"), ">")
    expected <- po(
      source_type = "r",
      file_type   = "pot",
      initial_comments = character(),
      metadata    = tibble::data_frame(
        name = c(
          "Project-Id-Version", "Report-Msgid-Bugs-To", "POT-Creation-Date",
          "PO-Revision-Date", "Last-Translator", "Language-Team",
          "MIME-Version", "Content-Type", "Content-Transfer-Encoding"
        ),
        value = c(
          paste("poio", packageDescription("poio", fields = "Version")),
          "https://github.com/RL10N/poio/issues", "2016-10-05 20:19",
          "DUMMY VALUE", me, "",
          "1.0", "text/plain; charset=UTF-8", "8bit"
        )
      ),
      direct = poio:::append_key(
        tibble::data_frame(
          msgid                     = character(),
          msgstr                    = character(),
          is_obsolete               = logical(),
          msgctxt                   = list(),
          translator_comments       = list(),
          source_reference_comments = list(),
          flags_comments            = list(),
          previous_string_comments  = list()
        )
      ),
      countable = poio:::append_key(
        tibble::data_frame(
          msgid                     = character(),
          msgid_plural              = character(),
          msgstr                    = list(),
          is_obsolete               = logical(),
          msgctxt                   = list(),
          translator_comments       = list(),
          source_reference_comments = list(),
          flags_comments            = list(),
          previous_string_comments  = list()
        )
      )
    )
    pot <- read_po(pot_file)
    pkg <- devtools::as.package(system.file(package = "poio"))
    expect_true(is.list(pkg))
    actual <- fix_metadata(pot, pkg)
    expect_po_equal(actual, expected, check_po_revision_date = TRUE)
  }
)

test_that(
  "fix_metadata works with user-specified metadata",
  {
    pot_file <- system.file("extdata/R-empty-raw.pot", package = "poio")
    project_id_version <- "99.9.9"
    report_msgid_bugs_to <- "Definitely Thomas not Richie"
    last_translator <- "The Girl with the Babel Fish"

    expected <- po(
      source_type = "r",
      file_type   = "pot",
      initial_comments = character(),
      metadata    = tibble::data_frame(
        name = c(
          "Project-Id-Version", "Report-Msgid-Bugs-To", "POT-Creation-Date",
          "PO-Revision-Date", "Last-Translator", "Language-Team",
          "MIME-Version", "Content-Type", "Content-Transfer-Encoding"
        ),
        value = c(
          project_id_version,
          report_msgid_bugs_to, "2016-10-05 20:19",
          "DUMMY VALUE", last_translator, "",
          "1.0", "text/plain; charset=UTF-8", "8bit"
        )
      ),
      direct = poio:::append_key(
        tibble::data_frame(
          msgid                     = character(),
          msgstr                    = character(),
          is_obsolete               = logical(),
          msgctxt                   = list(),
          translator_comments       = list(),
          source_reference_comments = list(),
          flags_comments            = list(),
          previous_string_comments  = list()
        )
      ),
      countable = poio:::append_key(
        tibble::data_frame(
          msgid                     = character(),
          msgid_plural              = character(),
          msgstr                    = list(),
          is_obsolete               = logical(),
          msgctxt                   = list(),
          translator_comments       = list(),
          source_reference_comments = list(),
          flags_comments            = list(),
          previous_string_comments  = list()
        )
      )
    )
    pot <- read_po(pot_file)
    pkg <- devtools::as.package(system.file(package = "poio"))
    expect_true(is.list(pkg))
    actual <- fix_metadata(
      pot, pkg,
      "Project-Id-Version" = project_id_version,
      .dots = list(
        "Report-Msgid-Bugs-To" = report_msgid_bugs_to,
        "Last-Translator" = last_translator
      )
    )
    expect_po_equal(actual, expected, check_po_revision_date = TRUE)
  }
)

test_that(
  "write_po works on an empty POT file",
  {
    pot_file <- system.file("extdata/R-empty-raw.pot", package = "poio")

    pot <- read_po(pot_file)
    out_file <- tempfile("actual.pot")
    write_po(pot, out_file)
    expect_identical(readLines(out_file), readLines(pot_file))
  }
)

#  ------------------------------------------------------------------------


test_that(
  "generate_po_from_pot can convert empty pot file to po file",
  {
    pot_file <- system.file("extdata/R-empty-raw.pot", package = "poio")
    expected <- po(
      source_type = "r",
      file_type   = "po",
      initial_comments = character(),
      metadata    = tibble::data_frame(
        name = c(
          "Project-Id-Version", "Report-Msgid-Bugs-To", "POT-Creation-Date",
          "PO-Revision-Date", "Last-Translator", "Language-Team",
          "MIME-Version", "Content-Type", "Content-Transfer-Encoding",
          "Language", "Plural-Forms"
        ),
        value = c(
          "R 3.3.1", "bugs.r-project.org", "2016-10-05 20:19",
          "YEAR-MO-DA HO:MI+ZONE", "FULL NAME <EMAIL@ADDRESS>", "LANGUAGE <LL@li.org>",
          "1.0", "text/plain; charset=CHARSET", "8bit",
          "ar", "nplurals=6; plural=(n==0 ? 0 : n==1 ? 1 : n==2 ? 2 : n%100>=3 && n%100<=10 ? 3 : n%100>=11 ? 4 : 5);"
        )
      ),
      direct = tibble::data_frame(
        msgid  = character(),
        msgstr = character(),
        is_obsolete = logical(),
        msgctxt = list(),
        translator_comments = list(),
        source_reference_comments = list(),
        flags_comments = list(),
        previous_string_comments = list()
      ),
      countable = tibble::data_frame(
        msgid         = character(),
        msgid_plural  = character(),
        msgstr        = list(),
        is_obsolete = logical(),
        msgctxt = list(),
        translator_comments = list(),
        source_reference_comments = list(),
        flags_comments = list(),
        previous_string_comments = list()
      )
    )
    pot <- read_po(pot_file)
    actual <- generate_po_from_pot(pot, "ar")
    expect_po_equal(actual, expected)
  }
)

