context("parse")

test_parse_field <- function(txt, expect) {
  j <- jsonlite::fromJSON(txt, simplifyVector = FALSE)
  test_that(sprintf("parsing %s works", j$type), {
    x <- kntn_parse_records(list(list(test = j)))
    if(is.function(expect)){
      expect_true(expect(x$test))
    } else {
      expect_identical(x$test, expect)
    }
  })
}

test_parse_field(
  '{
    "type": "RECORD_NUMBER",
    "value": "7"
  }',
  "7"
)

test_parse_field(
  '{
    "type": "__ID__",
    "value": "3"
  }',
  3L
)

test_parse_field(
  '{
    "type": "__REVISION__",
  "value": "9"
  }',
  9L
)

test_parse_field(
  '{
    "type": "CREATOR",
    "value": {
        "code": "john-d",
        "name": "John Doe"
    }
  }',
  "john-d"
)

test_parse_field(
  '{
  "type": "CREATOR",
  "value": null
  }',
  NA_character_
)

test_parse_field(
  '{
    "type": "CREATED_TIME",
    "value": "2015-01-22T15:07:00Z"
  }',
  as.POSIXct("2015-01-22 15:07:00", tz = "UTC")
)

test_parse_field(
  '{
  "type": "CREATED_TIME",
  "value": null
  }',
  function(x) is.na(x) && lubridate::is.POSIXct(x)
)

test_parse_field(
  '{
        "type": "MODIFIER",
        "value": {
            "code": "john-d",
            "name": "John Doe"
        }
  }',
  "john-d"
)

test_parse_field(
  '{
    "type": "UPDATED_TIME",
    "value": "2015-01-22T15:07:00Z"
  }',
  as.POSIXct("2015-01-22 15:07:00", tz = "UTC")
)

test_parse_field(
  '{
    "type": "SINGLE_LINE_TEXT",
    "value": "Hello kintone"
  }',
  "Hello kintone"
)

test_parse_field(
  '{
    "type": "NUMBER",
    "value": "777"
  }',
  777
)

test_parse_field(
  '{
    "type": "CALC",
    "value": "777888999"
  }',
  "777888999"
)

test_parse_field(
  '{
    "type": "MULTI_LINE_TEXT",
    "value": "Hello\\nkintone"
  }',
  "Hello\nkintone"
)

test_parse_field(
  '{
    "type": "RICH_TEXT",
    "value": "<a href=\\"https://www.kintone.com\\">kintone</a>"
  }',
  '<a href="https://www.kintone.com">kintone</a>'
)

test_parse_field(
  '{
    "type": "CHECK_BOX",
    "value": [
    "Choice 1",
    "Choice 2"
    ]
  }',
  list(c("Choice 1", "Choice 2"))
)

test_parse_field(
  '{
  "type": "CHECK_BOX",
  "value": [
  ]
  }',
  list(character(0))
)

test_parse_field(
  '{
    "type": "RADIO_BUTTON",
    "value": "Choice 3"
  }',
  "Choice 3"
)

test_parse_field(
  '{
    "type": "DROP_DOWN",
    "value": "Choice 1"
  }',
  "Choice 1"
)

test_parse_field(
  '{
    "type": "MULTI_SELECT",
    "value": [
    "Choice 1",
    "Choice 2"
    ]
  }',
  list(c("Choice 1", "Choice 2"))
)

test_parse_field(
  '{
    "type": "FILE",
    "value": [
        {
        "contentType": "text/plain",
        "fileKey":"20150417022053715283FF97DC413CBC4B7A41C",
        "name": "kintoneUpdates.txt",
        "size": "25302"
        },
        {
        "contentType": "text/plain",
        "fileKey": "20150417022159ECFC1223C4B34C939E1B9BD25",
        "name": "APIUpdatestxt",
        "size": "20311"
        }
    ]
  }',
  function(x) {
    is.list(x) && dplyr::is.tbl(x[[1]]) &&
      identical(colnames(x[[1]]), c("contentType", "fileKey", "name", "size"))
  }
)

test_parse_field(
  '{
  "type": "FILE",
  "value": []
  }',
  list(dplyr::data_frame())
)


test_parse_field(
  '{
    "type": "LINK",
    "value": "https://www.kintone.com/"
  }',
  "https://www.kintone.com/"
)

test_parse_field(
  '{
    "type": "DATE",
    "value": "2015-04-15"
  }',
  as.Date("2015-04-15")
)

test_parse_field(
  '{
  "type": "DATE",
  "value": null
  }',
  function(x) is.na(x) && lubridate::is.Date(x)
)

test_parse_field(
  '{
    "type": "TIME",
    "value": "09:00"
  }',
  "09:00"
)

test_parse_field(
  '{
    "type": "DATETIME",
    "value": "2015-03-17T10:20:00Z"
  }',
  as.POSIXct("2015-03-17 10:20:00", tz = "UTC")
)


test_parse_field(
  '{
    "type": "USER_SELECT",
    "value": [
        {
        "code": "john-d",
        "name": "John Doe"
        },
        {
        "code": "jane-r",
        "name": "Jane Roe"
        }
    ]
  }',
  list(c("john-d", "jane-r"))
)

test_parse_field(
  '{
    "type": "USER_SELECT",
    "value": []
  }',
  list(character(0))
)

test_parse_field(
  '{
    "type": "ORGANIZATION_SELECT",
    "value": [
        {
            "code": "human_resources",
            "name": "Human Resources"
        },
        {
            "code": "sales",
            "name": "Sales"
        }
    ]
  }',
  list(c("human_resources", "sales"))
)

test_parse_field(
  '{
    "type": "GROUP_SELECT",
    "value": [
        {
            "code": "project_manager",
            "name": "Project Manager"
        },
        {
            "code": "team_leader",
            "name": "Team Leader"
        }
    ]
  }',
  list(c("project_manager", "team_leader"))
)

test_parse_field(
  '{
    "type": "CATEGORY",
    "value": [
    "category1",
    "category2"
    ]
  }',
  list(c("category1", "category2"))
)

test_parse_field(
  '{
    "type": "STATUS",
    "value": "Not started"
  }',
  "Not started"
)

test_parse_field(
  '{
    "type": "STATUS_ASSIGNEE",
    "value": [
        {
        "code": "john-d",
        "name": "John Doe"
        }
    ]
  }',
  list(c("john-d"))
)

test_parse_field(
  '{
    "type": "SINGLE_LINE_TEXT",
    "value": "Code003"
  }',
  "Code003"
)

test_parse_field(
  '{
    "type": "SUBTABLE",
    "value": [
        {
            "id": "48277",
            "value": {
                "textfield_0": {
                    "type": "SINGLE_LINE_TEXT",
                    "value": "Hello kintone 1"
                },
                "numberfield_0": {
                    "type": "NUMBER",
                    "value": "5"
                },
                "checkboxfield_0": {
                    "type": "CHECK_BOX",
                    "value": [
                    "Choice1"
                    ]
                }
            }
        },
        {
            "id": "48278",
            "value": {
                "textfield_0": {
                    "type": "SINGLE_LINE_TEXT",
                    "value": "Hello kintone 2"
                },
                "numberfield_0": {
                    "type": "NUMBER",
                    "value": "7"
                },
                "checkboxfield_0": {
                    "type": "CHECK_BOX",
                    "value": [
                    "Choice2"
                    ]
                }
            }
        }
    ]
  }',
  function(x) {
    is.list(x) && dplyr::is.tbl(x[[1]]) &&
      identical(colnames(x[[1]]), c("textfield_0", "numberfield_0", "checkboxfield_0"))
  }
)

test_parse_field(
  '{
    "type": "SUBTABLE",
    "value": []
  }',
  list(dplyr::data_frame())
)


test_that('kntn_parse_subtable_one() works',
          {
            d <- kntn_parse_subtable_one(
              jsonlite::fromJSON('[
  {
    "id": "48277",
    "value": {
      "textfield_0": {
        "type": "SINGLE_LINE_TEXT",
        "value": "Hello kintone 1"
      },
      "numberfield_0": {
        "type": "NUMBER",
        "value": "5"
      },
      "checkboxfield_0": {
      "type": "CHECK_BOX",
        "value": [
          "Choice1"
        ]
      }
    }
  },
  {
    "id": "48278",
    "value": {
      "textfield_0": {
        "type": "SINGLE_LINE_TEXT",
        "value": "Hello kintone 2"
      },
      "numberfield_0": {
        "type": "NUMBER",
        "value": "7"
      },
      "checkboxfield_0": {
        "type": "CHECK_BOX",
        "value": [
          "Choice2"
        ]
      }
    }
  }
]', simplifyVector = FALSE))
            expect_true(dplyr::is.tbl(d))})
